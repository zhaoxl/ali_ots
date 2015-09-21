module AliOts
  module Metas
    #在BatchWriteRow操作中，表示要插入的一行信息。
    class PutRowInBatchWriteRowRequest < ::Protobuf::Message
      required AliOts::Metas::Condition, :condition, 1
      repeated AliOts::Metas::Column, :primary_key, 2
      repeated AliOts::Metas::Column, :attribute_columns, 3
    end
  end
end



=begin
message PutRowInBatchWriteRowRequest {
    required Condition condition = 1;
    repeated Column primary_key = 2;
    repeated Column attribute_columns = 3;
}

=end