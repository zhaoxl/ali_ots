module AliOts
  module Metas
    #在BatchWriteRow操作中，表示要写入的一个表的请求信息。
    class TableInBatchWriteRowRequest < ::Protobuf::Message
      required :string, :table_name, 1
      repeated AliOts::Metas::PutRowInBatchWriteRowRequest, :put_rows, 2
      repeated AliOts::Metas::UpdateRowInBatchWriteRowRequest, :update_rows, 3
      repeated AliOts::Metas::DeleteRowInBatchWriteRowRequest, :delete_rows, 4
    end
  end
end



=begin
message TableInBatchWriteRowRequest {
    required string table_name = 1;
    repeated PutRowInBatchWriteRowRequest put_rows = 2;
    repeated UpdateRowInBatchWriteRowRequest update_rows = 3;
    repeated DeleteRowInBatchWriteRowRequest delete_rows = 4;
}

=end