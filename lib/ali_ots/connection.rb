module AliOts
  class Connection
    attr_accessor :conn
    attr_accessor :logger
    
    def initialize(base_url = AliOts::CONFIG[:END_POSITION])
      self.conn = Faraday.new(:url => base_url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      self.logger = Logger.new(STDOUT)
      self.logger.level = AliOts::CONFIG[:DEBUG_LEVEL]
    end
    
    def request(action, body, headers = {})
      self.logger.info "body:==========================================================="
      self.logger.info body.to_json
      
      headers ||= {}
      url = AliOts::CONFIG[:END_POSITION] + "/" + action
      serialize_body = body.serialize_to_string
      ots_headers = make_headers(url, serialize_body)
      headers.merge!(ots_headers)
      
      response = conn.post do |req|
        req.url action
        req.headers.merge!(headers)
        req.body = serialize_body
      end
      
      self.logger.info "response:==========================================================="
      self.logger.info response
      
      return parse_response(response.status, response.headers, response.body)
    end
    
    def make_headers(query, body)
      md5 = Base64.encode64(Digest::MD5.digest(body)).gsub("\n", "")
      date = Time.now.gmtime.strftime('%a, %d %b %Y %H:%M:%S GMT')
      
      headers = {
          'x-ots-date' => date,
          'x-ots-apiversion' => AliOts::CONFIG[:APIVERSION],
          'x-ots-accesskeyid' => AliOts::CONFIG[:ACCESS_ID],
          'x-ots-instancename' => AliOts::CONFIG[:INSTANCE_NAME],
          'x-ots-contentmd5' => md5,
      }

      signature = make_request_signature(query, headers)
      headers['x-ots-signature'] = signature

      return headers
    end
    
    def make_request_signature(query, headers)
      require "addressable/uri"
      uri = URI.parse(query)
      path = uri.path
      query_string = uri.query

      addr_uri = Addressable::URI.new
      addr_uri.query = query_string
      addr_uri.query_values = addr_uri.query_values.sort_by{|q| q[0]} rescue {}
      sorted_query = addr_uri.query
      signature_string = path + "\n" + 'POST' + "\n" + sorted_query + "\n"

      headers_string = make_headers_string(headers)
      signature_string += headers_string + "\n"
      
      signature = call_signature_method(signature_string)
      return signature
    end
    
    def make_headers_string(headers)
      headers.sort_by{|k,v| k}.map{|k,v| "#{k}:#{v}"}.join("\n")
    end
    
    def call_signature_method(signature_string)
      digest = OpenSSL::Digest.new('sha1')
      hmac = OpenSSL::HMAC.digest(digest, AliOts::CONFIG[:ACCESS_KEY], signature_string)
      Base64.encode64(hmac).gsub("\n", "")
    end
    
    def parse_response(status, headers, body)
      check_headers(headers, body)
      
      return ["OK", body, status] if status >= 200 && status < 300
      return ["ERR", body, status]
    end
    
    def check_headers(headers, body)      
      # 1, check headers
      header_names = [
        'x-ots-contentmd5', 
        'x-ots-requestid', 
        'x-ots-date', 
        'x-ots-contenttype',
      ]
      self.logger.error("Missing Parameter: #{(header_names-headers.symbolize_keys.keys).join(", ")}") unless header_names == header_names&&headers.symbolize_keys.keys
      
      # 2, check md5
      md5 = Base64.encode64(Digest::MD5.digest(body)).gsub("\n", "")
      self.logger.error("MD5 mismatch in response") unless md5 == headers['x-ots-contentmd5']

      # 3, check date 
      self.logger.error("Invalid date format in response") unless server_time = (Time.parse(headers['x-ots-date']) rescue nil)
      
      # 4, check date range
      self.logger.error("The difference between date in response and system time is more than 15 minutes") unless (Time.now - server_time).abs < 15.minute
    end
  end
end





