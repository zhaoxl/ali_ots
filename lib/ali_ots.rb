require 'logger'
require 'protobuf'
require 'faraday'
require 'addressable/uri'

require 'ali_ots/client'
require 'ali_ots/connection'
require 'ali_ots/version'
require 'ali_ots/metas/enums/column_type'
require 'ali_ots/metas/enums/direction'
require 'ali_ots/metas/enums/operation_type'
require 'ali_ots/metas/enums/row_existence_expectation'
require 'ali_ots/metas/error'
require 'ali_ots/metas/condition'
require 'ali_ots/metas/column_schema'
require 'ali_ots/metas/column_value'
require 'ali_ots/metas/column_update'
require 'ali_ots/metas/column'
require 'ali_ots/metas/table_meta'
require 'ali_ots/metas/row_in_batch_get_row_request'
require 'ali_ots/metas/table_in_batch_get_row_request'
require 'ali_ots/metas/batch_get_row_request'
require 'ali_ots/metas/capacity_unit'
require 'ali_ots/metas/consumed_capacity'
require 'ali_ots/metas/row'
require 'ali_ots/metas/row_in_batch_get_row_response'
require 'ali_ots/metas/table_in_batch_get_row_response'
require 'ali_ots/metas/batch_get_row_response'
require 'ali_ots/metas/put_row_in_batch_write_row_request'
require 'ali_ots/metas/put_row_request'
require 'ali_ots/metas/put_row_response'
require 'ali_ots/metas/delete_row_in_batch_write_row_request'
require 'ali_ots/metas/update_row_in_batch_write_row_request'
require 'ali_ots/metas/table_in_batch_write_row_request'
require 'ali_ots/metas/row_in_batch_write_row_response'
require 'ali_ots/metas/table_in_batch_write_row_response'
require 'ali_ots/metas/batch_write_row_request'
require 'ali_ots/metas/batch_write_row_response'
require 'ali_ots/metas/reserved_throughput'
require 'ali_ots/metas/reserved_throughput_details'
require 'ali_ots/metas/create_table_request'
require 'ali_ots/metas/delete_row_request'
require 'ali_ots/metas/delete_row_response'
require 'ali_ots/metas/delete_table_request'
require 'ali_ots/metas/describe_table_request'
require 'ali_ots/metas/describe_table_response'
require 'ali_ots/metas/get_range_request'
require 'ali_ots/metas/get_range_response'
require 'ali_ots/metas/get_row_request'
require 'ali_ots/metas/get_row_response'
require 'ali_ots/metas/list_table_request'
require 'ali_ots/metas/list_table_response'
require 'ali_ots/metas/table_primary_key'
require 'ali_ots/metas/update_row_request'
require 'ali_ots/metas/update_row_response'
require 'ali_ots/metas/update_table_request'
require 'ali_ots/metas/update_table_response'


module AliOts
  
  AliOts::CONFIG = {
    DEBUG_LEVEL: ::Logger::DEBUG,
    END_POSITION: nil,
    ACCESS_ID: nil,
    ACCESS_KEY: nil,
    INSTANCE_NAME: nil, 
    APIVERSION: "2014-08-08"
  }
  
  extend self
  def configure
    yield(AliOts::CONFIG)
  end
  
end



















































