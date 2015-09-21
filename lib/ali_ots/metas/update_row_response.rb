module AliOts
  module Metas
    #更新指定行的数据，如果该行不存在，则新增一行；若该行存在，则根据请求的内容在这一行中新增、修改或者删除指定列的值。
    class UpdateRowResponse < ::Protobuf::Message
      required AliOts::Metas::ConsumedCapacity, :consumed, 1
    end
  end
end



=begin
message UpdateRowResponse {
    required ConsumedCapacity consumed = 1;
}

=end