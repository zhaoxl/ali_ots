module AliOts
  module Metas
    #查询指定表的结构信息和预留读写吞吐量设置信息。
    class DescribeTableRequest < ::Protobuf::Message
      required :string, :table_name, 1
    end
  end
end



=begin
message DescribeTableRequest {
    required string table_name = 1;
}
=end