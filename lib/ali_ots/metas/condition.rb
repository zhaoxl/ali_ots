module AliOts
  module Metas
    #在PutRow，UpdateRow和DeleteRow中使用的行判断条件，目前只含有row_existence一项。
    class Condition < ::Protobuf::Message
      required AliOts::Metas::Enums::RowExistenceExpectation, :row_existence, 1
    end
  end
end



=begin
message Condition {
    required RowExistenceExpectation row_existence = 1;
}
=end