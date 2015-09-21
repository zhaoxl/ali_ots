module AliOts
  module Metas
    #删除一行数据。
    class DeleteRowRequest < ::Protobuf::Message
      required :string, :table_name, 1
      required AliOts::Metas::Condition, :condition, 2
      repeated AliOts::Metas::Column, :primary_key, 3
    end
  end
end



=begin
message DeleteRowRequest {
    required string table_name = 1;
    required Condition condition = 2;
    repeated Column primary_key = 3;
}

=end