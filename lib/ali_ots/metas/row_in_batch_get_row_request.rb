module AliOts
  module Metas
    #在BatchGetRow操作中，表示要读取的一行请求信息。
    class RowInBatchGetRowRequest < ::Protobuf::Message
      repeated AliOts::Metas::Column, :primary_key, 1
    end
  end
end



=begin
message RowInBatchGetRowRequest {
    repeated Column primary_key = 1;
}

=end