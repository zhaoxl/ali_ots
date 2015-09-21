module AliOts
  module Metas
    #表示一个表的结构信息。
    class TableMeta < ::Protobuf::Message
      required :string, :table_name, 1
      repeated AliOts::Metas::ColumnSchema, :primary_key, 2
    end
  end
end



=begin
message TableMeta {
    required string table_name = 1;
    repeated ColumnSchema primary_key = 2;
}
=end