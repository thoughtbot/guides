# Class under test:

class Thing
  def awesome?
    true
  end
end

# RSpec test:

describe Thing, "#awesome?" do
  it "is true" do
    thing = Thing.new

    expect(thing).to be_awesome
  end
end
