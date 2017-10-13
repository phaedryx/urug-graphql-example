require "test_helper"

describe User do
  it "must be valid" do
    josh = User.create!(email: 'josh@example.com', password: 'test1234')
    value(josh).must_be :valid?
  end
end
