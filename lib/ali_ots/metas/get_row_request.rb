module AliOts
  module Metas
    #根据给定的主键读取单行数据。
    class GetRowRequest < ::Protobuf::Message
      required :string, :table_name, 1
      repeated AliOts::Metas::Column, :primary_key, 2
      repeated :string, :columns_to_get, 3
    end
  end
end



=begin
message GetRowRequest {
    required string table_name = 1;
    repeated Column primary_key = 2;
    repeated string columns_to_get = 3;
}

=end