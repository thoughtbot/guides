describe SomeClass do
  context "when defining a subject" do
    # GOOD
    # it's okay to define a `subject` here:
    subject { "foo" }

    it { should eq "foo" }
  end

  context "when using an explicit subject" do
    subject { "foo" }

    it "should equal foo" do
      # BAD
      # although it's valid RSpec code and this test passes,
      # it's not okay to use `subject` here:
      expect(subject).to eq "foo"
    end
  end

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
