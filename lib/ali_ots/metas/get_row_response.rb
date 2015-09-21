module AliOts
  module Metas
    #根据给定的主键读取单行数据。
    class GetRowResponse < ::Protobuf::Message
      required AliOts::Metas::ConsumedCapacity, :consumed, 1
      required AliOts::Metas::Row, :row, 2
    end
  end
end



=begin
message GetRowResponse {
    required ConsumedCapacity consumed = 1;
    required Row row = 2;
}
=end