module AliOts
  module Metas
    #插入数据到指定的行，如果该行不存在，则新增一行；若该行存在，则覆盖原有行。
    class PutRowRequest < ::Protobuf::Message
      required :string, :table_name, 1
      required AliOts::Metas::Condition, :condition, 2
      repeated AliOts::Metas::Column, :primary_key, 3
      repeated AliOts::Metas::Column, :attribute_columns, 4
    end
  end
end



=begin
message PutRowRequest {
    required string table_name = 1;
    required Condition condition = 2;
    repeated Column primary_key = 3;
    repeated Column attribute_columns = 4;
}
=end