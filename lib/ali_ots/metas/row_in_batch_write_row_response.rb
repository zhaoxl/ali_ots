module AliOts
  module Metas
    #在BatchWriteRow操作的返回消息中，表示一行写入操作的结果。
    class RowInBatchWriteRowResponse < ::Protobuf::Message
      required :bool, :is_ok, 1
      optional AliOts::Metas::Error, :error, 2
      optional AliOts::Metas::ConsumedCapacity, :consumed, 3
    end
  end
end



=begin
message RowInBatchWriteRowResponse {
    required bool is_ok = 1 [default = true];
    optional Error error = 2;
    optional ConsumedCapacity consumed = 3;
}

=end