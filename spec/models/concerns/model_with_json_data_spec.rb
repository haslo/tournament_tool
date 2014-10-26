module JSONTestTemps
  class BasicModelDouble
    include Concerns::ModelWithJSONData
    def self.json_data_field_descriptions
      [
        {name: :string_field, data_type: String},
        {name: :integer_field, data_type: Integer},
        {name: :array_field, data_type: Array},
        {name: :hash_field, data_type: Hash}
      ]
    end
    def json_data
      @json_data ||= {}
    end
  end
  class ValidatedModelDouble
    include Concerns::ModelWithJSONData
    include ActiveModel::Validations
    validates :number_field_with_min, numericality: {greater_than: 5}
    validates :required_field, presence: true
    def self.json_data_field_descriptions
      [
        {name: :unrequired_field, data_type: String},
        {name: :required_field, data_type: String},
        {name: :number_field_with_min, data_type: Integer}
      ]
    end
    def json_data
      @json_data ||= {}
    end
  end
end

describe Concerns::ModelWithJSONData do

  context 'JSON data storage' do
    subject { JSONTestTemps::BasicModelDouble.new }
    it_behaves_like 'uses JSON data'
  end

  context 'validations' do
    subject { JSONTestTemps::ValidatedModelDouble.new }
    it_behaves_like 'uses JSON data'

    context 'validations' do
      it 'is not valid by default' do
        expect(subject).not_to be_valid
      end
      it 'no longer has an error for a required field once it is present' do
        subject.valid?
        expect(subject.errors[:required_field]).not_to be_blank
        subject.required_field = 'value'
        subject.valid?
        expect(subject.errors[:required_field]).to be_blank
      end
      it 'has an error for a too small numerical value in the minimum value field' do
        subject.valid?
        expect(subject.errors[:number_field_with_min]).not_to be_blank
        subject.number_field_with_min = 3
        subject.valid?
        expect(subject.errors[:number_field_with_min]).not_to be_blank
      end
      it 'has no error for a large enough numerical value in the minimum value field' do
        subject.valid?
        expect(subject.errors[:number_field_with_min]).not_to be_blank
        subject.number_field_with_min = 6
        subject.valid?
        expect(subject.errors[:number_field_with_min]).to be_blank
      end
      it 'is valid with present required field and large enough numerical value' do
        subject.required_field = 'value'
        subject.number_field_with_min = 6
        expect(subject).to be_valid
      end
    end
  end

end
