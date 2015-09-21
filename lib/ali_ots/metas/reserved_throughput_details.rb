module AliOts
  module Metas
    #更新指定表的预留读吞吐量或预留写吞吐量设置，新设定将于更新成功一分钟内生效。
    class ReservedThroughputDetails < ::Protobuf::Message
      required AliOts::Metas::CapacityUnit, :capacity_unit, 1
      required :int64, :last_increase_time, 2
      optional :int64, :last_decrease_time, 3
      required :int32, :number_of_decreases_today, 4
    end
  end
end



=begin
message ReservedThroughputDetails {
    required CapacityUnit capacity_unit = 1;
    required int64 last_increase_time = 2;
    optional int64 last_decrease_time = 3;
    required int32 number_of_decreases_today = 4;
}
=end