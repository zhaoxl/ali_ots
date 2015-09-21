module AliOts
  module Metas
    #定义一列，只用于主键列。
    class ColumnSchema < ::Protobuf::Message
      required :string, :name, 1;
      required ::AliOts::Metas::Enums::ColumnType, :type, 2;
    end
  end
end



=begin
message ColumnSchema {
    required string name = 1;
    required ColumnType type = 2;
}
=end