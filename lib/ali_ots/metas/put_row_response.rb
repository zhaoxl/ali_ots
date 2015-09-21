module AliOts
  module Metas
    #插入数据到指定的行，如果该行不存在，则新增一行；若该行存在，则覆盖原有行。
    class PutRowResponse < ::Protobuf::Message
      required AliOts::Metas::ConsumedCapacity, :consumed, 1
    end
  end
end



=begin
message PutRowResponse {
    required ConsumedCapacity consumed = 1;
}

=end