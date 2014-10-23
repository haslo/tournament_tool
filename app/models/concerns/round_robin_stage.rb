module Concerns
  module RoundRobinStage

    extend ActiveSupport::Concern

    module ClassMethods
      def type_key
        :round_robin
      end
    end

  end
end
