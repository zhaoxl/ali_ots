module AliOts
  module Metas
    #用于在操作失败时的响应消息中表示错误信息，以及在BatchGetRow和BatchWriteRow操作的响应消息中表示单行请求的错误。
    class Error < ::Protobuf::Message
      required :string, :code, 1
      optional :string, :message, 2
    end
  end
end



=begin
Error {
    required string code = 1;
    optional string message = 2;
}

=end