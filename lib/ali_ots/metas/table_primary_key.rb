module AliOts
  module Metas
    class TablePrimaryKey
      attr_accessor :name
      attr_accessor :type
      
      def initialize(name, type)
        self.name = name
        self.type = type
      end
      
      def to_s
%Q{primary_key {
      name: "#{name}"
      type: #{type}
    }
  }
      end
    end
  end
end
