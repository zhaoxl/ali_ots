module AliOts
  module Metas
    #在BatchGetRow操作的返回消息中，表示一个表的数据。
    class TableInBatchGetRowResponse < ::Protobuf::Message
      required :string, :table_name, 1
      repeated AliOts::Metas::RowInBatchGetRowResponse, :rows, 2
    end
  end
end



=begin
message TableInBatchGetRowResponse {
    required string table_name = 1;
    repeated RowInBatchGetRowResponse rows = 2;
}


=end