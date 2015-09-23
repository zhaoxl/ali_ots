module AliOts
  module Metas
    module Enums
      #表示一列的数据类型，枚举类型。
      #INF_MIN和INF_MAX为GetRange操作专用类型，value的type为INF_MIN的Column为小于其它所有Column，value的type为INF_MAX的Column大于其它所有Column。
      class ColumnType < ::Protobuf::Enum
        set_option :allow_alias
        define :INF_MIN, 0
        define :INF_MAX, 1
        define :INTEGER, 2
        define :STRING, 3
        define :BOOLEAN, 4
        define :DOUBLE, 5
        define :BINARY, 6
      end
      
    end
  end
end



=begin
enum ColumnType {
    INF_MIN = 0;
    INF_MAX = 1;
    INTEGER = 2;
    STRING = 3;
    BOOLEAN = 4;
    DOUBLE = 5;
    BINARY = 6;
}
=end