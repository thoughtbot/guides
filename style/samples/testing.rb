describe SomeClass do
  it { should have_one(:association) }
  it { should validate_presence_of(:some_attribute) }

  describe '.some_class_method' do
    it 'does something' do
      # ...
    end
  end

  describe '#some_instance_method' do
    it 'does something' do
      expect(something).to eq 'something'
    end
  end

  describe '#another_instance_method' do
    context 'when in one case' do
      it 'does something' do
        # ...
      end
    end

    context 'when in other case' do
      it 'does something else' do
        # ...
      end
    end
  end
end
