require "test_helper"

describe Link do
  it "must be valid" do
    link = links(:google)
    value(link).must_be :valid?
  end
end
