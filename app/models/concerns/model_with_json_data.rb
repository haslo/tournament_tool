module Concerns
  module ModelWithJSONData

    extend ActiveSupport::Concern

    module ClassMethods
      def json_data_field_descriptions
        []
      end
    end

    def method_missing(method, *args, &block)

      self.class.json_data_field_descriptions.each do |field_description|
        if field_description[:name].to_s == method.to_s
          self.class.__send__(:define_method, field_description[:name].to_sym) do
            self.json_data ||= {}
            self.json_data[field_description[:name].to_s]
          end
          return __send__(field_description[:name])
        end

        if "#{field_description[:name]}=" == method.to_s
          self.class.__send__(:define_method, "#{field_description[:name]}=".to_sym) do |value|
            self.json_data ||= {}
            self.json_data[field_description[:name].to_s] = __send__(field_description[:data_type].name, value)
          end
          return __send__("#{field_description[:name]}=", args[0])
        end
      end

      super
    end

  end
end
