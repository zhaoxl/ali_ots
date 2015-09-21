module AliOts
  module Metas
    #表示一次操作消耗的服务能力单元。
    class ConsumedCapacity < ::Protobuf::Message
      required AliOts::Metas::CapacityUnit, :consumed, 1
    end
  end
end



=begin
message ConsumedCapacity {
    required CapacityUnit capacity_unit = 1;
}

=end