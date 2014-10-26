shared_examples 'uses JSON data' do

  def test_value_for(field_description, index)
    case field_description[:data_type].name
      when 'String'
        "test#{index}"
      when 'Integer'
        index
      when 'Array'
        Array(0..index)
      when 'Hash'
        {index => "#{index}"}
      else
        raise "unsupported test type #{field_description[:data_type]}"
    end
  end

  it 'does not raise an error for field_description getter methods' do
    subject.class.json_data_field_descriptions.each do |field_description|
      expect{(subject.send(field_description[:name]))}.not_to raise_error
    end
  end

  it 'does not raise an error for field setter methods' do
    subject.class.json_data_field_descriptions.each do |field_description|
      expect{(subject.send("#{field_description[:name]}=", test_value_for(field_description, 0)))}.not_to raise_error
    end
  end

  context 'uninitialized json data field' do
    it 'responds with nil for each field_description' do
      subject.class.json_data_field_descriptions.each do |field_description|
        expect(subject.send(field_description[:name])).to be nil
      end
    end
  end

  context 'setters and getters' do
    context 'values' do
      it 'responds with the stored value for each field_description after using the setter' do
        subject.class.json_data_field_descriptions.each do |field_description|
          expect(subject.send("#{field_description[:name]}=", test_value_for(field_description, 0))).to eq(test_value_for(field_description, 0))
          expect(subject.send(field_description[:name])).to eq(test_value_for(field_description, 0))
        end
      end
      it 'responds with the stored value for each field_description after using the setter twice' do
        subject.class.json_data_field_descriptions.each do |field_description|
          expect(subject.send("#{field_description[:name]}=", test_value_for(field_description, 0))).to eq(test_value_for(field_description, 0))
          expect(subject.send(field_description[:name])).to eq(test_value_for(field_description, 0))
          expect(subject.send("#{field_description[:name]}=", test_value_for(field_description, 1))).to eq(test_value_for(field_description, 1))
          expect(subject.send(field_description[:name])).to eq(test_value_for(field_description, 1))
        end
      end
    end
    context 'data types' do
      context 'data types' do
        it 'does allow assignment of Strings to String fields' do
          subject.class.json_data_field_descriptions.each do |field_description|
            if field_description[:data_type] == String
              expect(subject.send("#{field_description[:name]}=", 'string')).to eq('string')
              expect(subject.send(field_description[:name])).to eq('string')
            end
          end
        end
        it 'does not allow assignment of non-Integers to Integer fields' do
          subject.class.json_data_field_descriptions.each do |field_description|
            if field_description[:data_type] == Integer
              expect{subject.send("#{field_description[:name]}=", {invalid: 'string'})}.to raise_error(TypeError)
            end
          end
        end
        it 'does not allow assignment of non-Hashes to Hash fields' do
          subject.class.json_data_field_descriptions.each do |field_description|
            if field_description[:data_type] == Hash
              expect{subject.send("#{field_description[:name]}=", 'not a hash')}.to raise_error(TypeError)
            end
          end
        end
        it 'does allow assignment of Strings to Array fields with implicit conversion' do
          subject.class.json_data_field_descriptions.each do |field_description|
            if field_description[:data_type] == Array
              expect(subject.send("#{field_description[:name]}=", 'string')).to eq(['string'])
              expect(subject.send(field_description[:name])).to eq(['string'])
            end
          end
        end
      end
    end
  end

  context 'JSON storage' do
    it 'stores the value in the json_data field_description when using the setter' do
      subject.class.json_data_field_descriptions.each do |field_description|
        expect(subject.send("#{field_description[:name]}=", test_value_for(field_description, 0))).to eq(test_value_for(field_description, 0))
        expect(subject.send("#{field_description[:name]}=", test_value_for(field_description, 1))).to eq(test_value_for(field_description, 1))
        expect(subject.json_data[field_description[:name].to_s]).to eq(test_value_for(field_description, 1))
      end
    end
    it 'retrieves the value from the json_data field_description when using the getter' do
      subject.class.json_data_field_descriptions.each do |field_description|
        expect(subject.send("#{field_description[:name]}=", test_value_for(field_description, 0))).to eq(test_value_for(field_description, 0))
        subject.json_data[field_description[:name].to_s] = test_value_for(field_description, 1)
        expect(subject.send(field_description[:name].to_s)).to eq(test_value_for(field_description, 1))
      end
    end
  end

end
