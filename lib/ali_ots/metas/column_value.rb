module AliOts
  module Metas
    #表示一列的列值。
    class ColumnValue < ::Protobuf::Message
      required AliOts::Metas::Enums::ColumnType, :type, 1;
      optional :int64, :v_int, 2
      optional :string, :v_string, 3
      optional :bool, :v_bool, 4
      optional :double, :v_double, 5
      optional :bytes, :v_binary, 6
    end
  end
end



=begin
message ColumnValue {
    required ColumnType type = 1;
    optional int64 v_int = 2;
    optional string v_string = 3;
    optional bool v_bool = 4;
    optional double v_double = 5;
    optional bytes v_binary = 6;
}

=end