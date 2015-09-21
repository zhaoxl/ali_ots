module AliOts
  module Metas
    #更新指定表的预留读吞吐量或预留写吞吐量设置，新设定将于更新成功一分钟内生效。
    class UpdateTableResponse < ::Protobuf::Message
      required AliOts::Metas::ReservedThroughputDetails, :reserved_throughput_details, 1
    end
  end
end



=begin
message UpdateTableResponse {
    required ReservedThroughputDetails reserved_throughput_details = 1;
}
=end