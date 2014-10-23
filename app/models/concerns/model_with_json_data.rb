module Concerns
  module ModelWithJSONData

    extend ActiveSupport::Concern

    module ClassMethods
      def json_data_fields
        []
      end
    end

    def method_missing(method, *args, &block)
      self.class.json_data_fields.each do |field|
        if field.to_s == method.to_s
          self.json_data ||= {}
          return self.json_data[field.to_s]
        end
        if "#{field}=" == method.to_s
          self.json_data ||= {}
          return self.json_data[field.to_s] = args[0]
        end
      end
      super
    end

  end
end
