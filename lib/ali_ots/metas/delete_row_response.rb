module AliOts
  module Metas
    #删除一行数据。
    class DeleteRowResponse < ::Protobuf::Message
      required AliOts::Metas::ConsumedCapacity, :consumed, 1
    end
  end
end



=begin
message DeleteRowResponse {
    required ConsumedCapacity consumed = 1;
}

=end