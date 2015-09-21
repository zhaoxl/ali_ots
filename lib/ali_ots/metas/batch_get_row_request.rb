module AliOts
  module Metas
    #批量读取一个或多个表中的若干行数据。
    class BatchGetRowRequest < ::Protobuf::Message
      repeated AliOts::Metas::TableInBatchGetRowRequest, :tables, 1
    end
  end
end



=begin
message BatchGetRowRequest {
    repeated TableInBatchGetRowRequest tables = 1;
}

=end