module AliOts
  module Metas
    #在GetRow和GetRange的响应消息中，表示一行数据。
    class Row < ::Protobuf::Message
      repeated AliOts::Metas::Column, :primary_key_columns, 1
      repeated AliOts::Metas::Column, :attribute_columns, 2
    end
  end
end



=begin
message Row {
    repeated Column primary_key_columns = 1;
    repeated Column attribute_columns = 2;
}

=end