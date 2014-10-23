module Concerns
  module EliminationStage

    extend ActiveSupport::Concern

    module ClassMethods
      def type_key
        :elimination
      end
    end

  end
end
