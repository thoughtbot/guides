# Class under test:
class Thing
  def initialize(user)
    @user = user
  end

  def awesome
    42
  end
end

# Preferred RSpec test:
describe Thing, "#awesome" do
  it "returns the secret" do
    user = create(:user)

    result = Thing.new(user).awesome

    expect(result).to eq 42
  end
end

# Instead of:
describe Thing, "#awesome" do
  it "returns the secret" do
    user = create(:user)
    thing = Thing.new(user)

    result = thing.awesome

    expect(result).to eq 42
  end
end
