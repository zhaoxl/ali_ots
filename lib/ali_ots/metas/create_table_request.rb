module AliOts
  module Metas
    #根据给定的表结构信息创建相应的表。
    class CreateTableRequest < ::Protobuf::Message
      required ::AliOts::Metas::TableMeta, :table_meta, 1
      required ::AliOts::Metas::ReservedThroughput, :reserved_throughput, 2
    end
  end
end



=begin
message CreateTableRequest {
    required TableMeta table_meta = 1;
    required ReservedThroughput reserved_throughput = 2;
}
=end