module AliOts
  module Metas
    #表示一次操作消耗服务能力单元的值或是一个表的预留读写吞吐量的值。
    class CapacityUnit < ::Protobuf::Message
      optional :int32, :read, 1
      optional :int32, :write, 2
    end
  end
end



=begin
message CapacityUnit {
    optional int32 read = 1;
    optional int32 write = 2;
}
=end

