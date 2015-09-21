module AliOts
  module Metas
    #表示一个表设置的预留读写吞吐量数值。
    class ReservedThroughput < ::Protobuf::Message
      required ::AliOts::Metas::CapacityUnit, :capacity_unit, 1;
    end
  end
end



=begin
message ReservedThroughput {
    required CapacityUnit capacity_unit = 1;
}
=end