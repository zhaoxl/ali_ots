module AliOts
  module Metas
    #批量插入，修改或删除一个或多个表中的若干行数据。
    class BatchWriteRowRequest < ::Protobuf::Message
      repeated AliOts::Metas::TableInBatchWriteRowRequest, :tables, 1
    end
  end
end



=begin
message BatchWriteRowRequest {
    repeated TableInBatchWriteRowRequest tables = 1;
}

=end