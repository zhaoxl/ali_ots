module AliOts
  module Metas
    #在BatchGetRow操作中，表示要读取的一个表的请求信息。
    class TableInBatchGetRowRequest < ::Protobuf::Message
      required :string, :table_name, 1;
      repeated AliOts::Metas::RowInBatchGetRowRequest, :rows, 2;
      repeated :string, :columns_to_get, 3;
    end
  end
end



=begin
message TableInBatchGetRowRequest {
    required string table_name = 1;
    repeated RowInBatchGetRowRequest rows = 2;
    repeated string columns_to_get = 3;
}

=end