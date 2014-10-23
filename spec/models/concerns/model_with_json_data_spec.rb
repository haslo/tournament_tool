module TestTemps
  class ModelWithJSONDataDouble
    include Concerns::ModelWithJSONData
    def self.json_data_fields
      [
        :first_field,
        :second_field
      ]
    end
    def json_data
      @json_data ||= {}
    end
  end
end

describe Concerns::ModelWithJSONData do

  subject { TestTemps::ModelWithJSONDataDouble.new }

  it_behaves_like 'uses JSON data'

end
