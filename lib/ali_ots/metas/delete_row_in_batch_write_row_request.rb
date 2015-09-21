module AliOts
  module Metas
    #在BatchWriteRow操作中，表示要删除的一行信息。
    class DeleteRowInBatchWriteRowRequest < ::Protobuf::Message
      required AliOts::Metas::Condition, :condition, 1
      repeated AliOts::Metas::Column, :primary_key, 2
    end
  end
end



=begin
message DeleteRowInBatchWriteRowRequest {
    required Condition condition = 1;
    repeated Column primary_key = 2;
}

=end