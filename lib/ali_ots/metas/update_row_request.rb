module AliOts
  module Metas
    #更新指定行的数据，如果该行不存在，则新增一行；若该行存在，则根据请求的内容在这一行中新增、修改或者删除指定列的值。
    class UpdateRowRequest < ::Protobuf::Message
      required :string, :table_name, 1
      required AliOts::Metas::Condition, :condition, 2
      repeated AliOts::Metas::Column, :primary_key, 3
      repeated AliOts::Metas::ColumnUpdate, :attribute_columns, 4
    end
  end
end



=begin
message UpdateRowRequest {
    required string table_name = 1;
    required Condition condition = 2;
    repeated Column primary_key = 3;
    repeated ColumnUpdate attribute_columns = 4;
}
=end