module AliOts
  module Metas
    #在BatchWriteRow操作中，表示对一个表进行写入的结果。
    class BatchWriteRowResponse < ::Protobuf::Message
      repeated AliOts::Metas::TableInBatchWriteRowResponse, :tables, 1
    end
  end
end



=begin
message BatchWriteRowResponse {
    repeated TableInBatchWriteRowResponse tables = 1;
}

=end