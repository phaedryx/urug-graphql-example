require "test_helper"

describe Bookmark do
  it "must be valid" do
    bookmark = bookmarks(:bob_google)
    value(bookmark).must_be :valid?
  end
end
