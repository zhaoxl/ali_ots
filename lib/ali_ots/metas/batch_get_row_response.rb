module AliOts
  module Metas
    #批量读取一个或多个表中的若干行数据。
    class BatchGetRowResponse < ::Protobuf::Message
      repeated AliOts::Metas::TableInBatchGetRowResponse, :tables, 1
    end
  end
end



=begin
message BatchGetRowResponse {
    repeated TableInBatchGetRowResponse tables = 1;
}

=end