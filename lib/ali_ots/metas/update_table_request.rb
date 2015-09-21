module AliOts
  module Metas
    #更新指定表的预留读吞吐量或预留写吞吐量设置，新设定将于更新成功一分钟内生效。
    class UpdateTableRequest < ::Protobuf::Message
      required :string, :table_name, 1
      required AliOts::Metas::ReservedThroughput, :reserved_throughput, 2
    end
  end
end



=begin
message UpdateTableRequest {
    required string table_name = 1;
    required ReservedThroughput reserved_throughput = 2;
}
=end