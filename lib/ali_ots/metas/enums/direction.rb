module AliOts
  module Metas
    module Enums
      #在GetRange操作中，查询数据的顺序。
      class Direction < ::Protobuf::Enum
        define :FORWARD, 0
        define :BACKWARD, 1
      end
    end
  end
end



=begin
enum Direction {
    FORWARD = 0;
    BACKWARD = 1;
}

=end