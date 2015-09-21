module AliOts
  module Metas
    #读取指定主键范围内的数据。
    class GetRangeRequest < ::Protobuf::Message
      required :string, :table_name, 1;
      required AliOts::Metas::Enums::Direction, :direction, 2;
      repeated :string, :columns_to_get, 3;
      optional :int32, :limit, 4;
      repeated AliOts::Metas::Column, :inclusive_start_primary_key, 5;
      repeated AliOts::Metas::Column, :exclusive_end_primary_key, 6;
    end
  end
end



=begin
message GetRangeRequest {
    required string table_name = 1;
    required Direction direction = 2;
    repeated string columns_to_get = 3;
    optional int32 limit = 4;
    repeated Column inclusive_start_primary_key = 5;
    repeated Column exclusive_end_primary_key = 6;
}

=end