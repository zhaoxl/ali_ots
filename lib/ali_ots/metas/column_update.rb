module AliOts
  module Metas
    #在UpdateRow中，表示更新一列的信息。
    class ColumnUpdate < ::Protobuf::Message
      required AliOts::Metas::Enums::OperationType, :type, 1;
      required :string, :name, 2;
      optional AliOts::Metas::ColumnValue, :value, 3;
    end
  end
end



=begin
message ColumnUpdate {
    required OperationType type = 1;
    required string name = 2;
    optional ColumnValue value = 3;
}

=end