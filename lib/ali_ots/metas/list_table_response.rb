module AliOts
  module Metas
    #查询指定表的结构信息和预留读写吞吐量设置信息。
    class ListTableResponse < ::Protobuf::Message
      repeated :string, :table_names, 1
    end
  end
end



=begin
message ListTableResponse {
    repeated string table_names = 1;
}
=end