module Concerns
  module SwissStage

    extend ActiveSupport::Concern

    module ClassMethods
      def type_key
        :swiss
      end
    end

  end
end
