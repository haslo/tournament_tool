module Concerns
  module DoubleEliminationStage

    extend ActiveSupport::Concern

    module ClassMethods
      def type_key
        :double_elimination
      end
    end

  end
end
