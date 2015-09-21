module AliOts
  module Metas
    module Enums
      #在UpdateRow中，表示对一列的修改方式。
      class OperationType < ::Protobuf::Enum
        define :PUT, 1
        define :DELETE, 2
      end
    end
  end
end



=begin
enum OperationType {
    PUT = 1;
    DELETE = 2;
}


=end