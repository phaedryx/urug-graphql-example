require "test_helper"

describe User do
  it "must be valid" do
    bob = users(:bob)
    value(bob).must_be :valid?
  end
end
