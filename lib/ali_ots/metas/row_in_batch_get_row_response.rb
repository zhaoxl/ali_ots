module AliOts
  module Metas
    #在BatchGetRow操作的返回消息中，表示一行数据。
    class RowInBatchGetRowResponse < ::Protobuf::Message
      required :bool, :is_ok, 1;
      optional AliOts::Metas::Error, :error, 2;
      optional AliOts::Metas::ConsumedCapacity, :consumed, 3
      optional AliOts::Metas::Row, :row, 4
    end
  end
end



=begin
message RowInBatchGetRowResponse {
    required bool is_ok = 1 [default = true];
    optional Error error = 2;
    optional ConsumedCapacity consumed = 3;
    optional Row row = 4;
}

=end