module AliOts
  module Metas
    #查询指定表的结构信息和预留读写吞吐量设置信息。
    class DescribeTableResponse < ::Protobuf::Message
      required ::AliOts::Metas::TableMeta, :table_meta, 1
      required ::AliOts::Metas::ReservedThroughput, :reserved_throughput, 2
    end
  end
end



=begin
message DescribeTableResponse {
    required TableMeta table_meta = 1;
    required ReservedThroughputDetails reserved_throughput_details = 2;
}
=end