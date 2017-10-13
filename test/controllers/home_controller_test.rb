require "test_helper"

describe HomeController do
  it 'should get root index' do
    get root_url
    value(response).must_be :success?
  end
end
