module AliOts
  module Metas
    module Enums
      class RowExistenceExpectation < ::Protobuf::Enum
        define :IGNORE, 0
        define :EXPECT_EXIST, 1;
        define :EXPECT_NOT_EXIST, 2;
      end
    end
  end
end



=begin
enum RowExistenceExpectation {
    IGNORE = 0;
    EXPECT_EXIST = 1;
    EXPECT_NOT_EXIST = 2;
}
=end