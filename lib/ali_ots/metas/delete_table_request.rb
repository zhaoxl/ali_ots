module AliOts
  module Metas
    #删除本实例下指定的表。
    class DeleteTableRequest < ::Protobuf::Message
      required :string, :table_name, 1
    end
  end
end



=begin
message DeleteTableRequest {
    required string table_name = 1;
}

=end