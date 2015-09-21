module AliOts
  module Metas
    #表示一列。
    class Column < ::Protobuf::Message
      required :string, :name, 1
      required AliOts::Metas::ColumnValue, :value, 2
    end
  end
end



=begin
message Column {
    required string name = 1;
    required ColumnValue value = 2;
}

=end