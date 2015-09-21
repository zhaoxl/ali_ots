module AliOts
  module Metas
    #读取指定主键范围内的数据。
    class GetRangeResponse < ::Protobuf::Message
      required AliOts::Metas::ConsumedCapacity, :consumed, 1
      repeated AliOts::Metas::Column, :next_start_primary_key, 2
      repeated AliOts::Metas::Row, :rows, 3
    end
  end
end



=begin
message GetRangeResponse {
    required ConsumedCapacity consumed = 1;
    repeated Column next_start_primary_key = 2;
    repeated Row rows = 3;
}

=end