shared_examples 'uses JSON data' do

  it 'does not raise an error for field getter methods' do
    subject.class.json_data_fields.each do |field|
      expect{(subject.send(field))}.not_to raise_error
    end
  end

  it 'does not raise an error for field setter methods' do
    subject.class.json_data_fields.each do |field|
      expect{(subject.send("#{field}=", 'test'))}.not_to raise_error
    end
  end

  context 'uninitialized json data fields' do
    it 'responds with nil for each field' do
      subject.class.json_data_fields.each do |field|
        expect(subject.send(field)).to be nil
      end
    end
  end

  context 'setters and getters' do
    it 'responds with the stored value for each field after using the setter' do
      subject.class.json_data_fields.each do |field|
        expect(subject.send("#{field}=", 'test')).to eq('test')
        expect(subject.send(field)).to eq('test')
      end
    end
    it 'responds with the stored value for each field after using the setter twice' do
      subject.class.json_data_fields.each do |field|
        expect(subject.send("#{field}=", 'test1')).to eq('test1')
        expect(subject.send(field)).to eq('test1')
        expect(subject.send("#{field}=", 'test2')).to eq('test2')
        expect(subject.send(field)).to eq('test2')
      end
    end
  end

  context 'JSON storage' do
    it 'stores the value in the json_data field when using the setter' do
      subject.class.json_data_fields.each do |field|
        expect(subject.send("#{field}=", 'test1')).to eq('test1')
        expect(subject.send("#{field}=", 'test2')).to eq('test2')
        expect(subject.json_data[field.to_s]).to eq('test2')
      end
    end
    it 'retrieves the value from the json_data field when using the getter' do
      subject.class.json_data_fields.each do |field|
        expect(subject.send("#{field}=", 'test1')).to eq('test1')
        subject.json_data[field.to_s] = 'test2'
        expect(subject.send(field.to_s)).to eq('test2')
      end
    end
  end

end
