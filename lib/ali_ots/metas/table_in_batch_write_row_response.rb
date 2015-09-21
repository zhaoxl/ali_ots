module AliOts
  module Metas
    #在BatchWriteRow操作中，表示对一个表进行写入的结果。
    class TableInBatchWriteRowResponse < ::Protobuf::Message
      required :string, :table_name, 1
      repeated AliOts::Metas::RowInBatchWriteRowResponse, :put_rows, 2
      repeated AliOts::Metas::RowInBatchWriteRowResponse, :update_rows, 3
      repeated AliOts::Metas::RowInBatchWriteRowResponse, :delete_rows, 4
    end
  end
end



=begin
message TableInBatchWriteRowResponse {
    required string table_name = 1;
    repeated RowInBatchWriteRowResponse put_rows = 2;
    repeated RowInBatchWriteRowResponse update_rows = 3;
    repeated RowInBatchWriteRowResponse delete_rows = 4;
}

=end