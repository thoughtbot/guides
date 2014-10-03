describe User do
  # preferred way to stub multiple methods

  it "uses single line allow syntax for multiple stubs on an object" do
    user = create(:user)
    allow(user).to receive_messages(age: 11, first_name: "Ralph")

    expect(user.age).to eq 11
    expect(user.first_name).to eq "Ralph"
  end
end
