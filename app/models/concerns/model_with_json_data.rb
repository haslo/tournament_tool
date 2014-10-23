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
          self.class.send(:define_method, field.to_sym) do
            self.json_data ||= {}
            self.json_data[field.to_s]
          end
          return send(field)
        end

        if "#{field}=" == method.to_s
          self.class.send(:define_method, "#{field}=".to_sym) do |value|
            self.json_data ||= {}
            self.json_data[field.to_s] = value
          end
          return send("#{field}=", args[0])
        end
      end

      super
    end

  end
end
