require 'test_helper'

describe GraphqlController do
  it 'should be able to find information for a single link' do
    link = links(:google)
    # Note that graphiql would format the query like this:
    # {
    #   link(id: 1234) {
    #     url
    #   }
    # }
    # The whitespace is for readability, but isn't necessary
    post graphql_url, params: {query: "{link(id:#{link.id}){url}}"}
    data = parse_response(@response)

    assert_equal({'link' => {'url' => 'https://www.google.com'}}, data)
  end

  it 'should be able to find all users' do
    post graphql_url, params: {query: '{users{full_name}}'}
    data = parse_response(@response)

    assert_equal({'users' => [
      {'full_name' => 'Bob Ross'}, {'full_name' => 'Tony Stark'}
    ]}, data)
  end

  def parse_response(response)
    JSON.parse(response.body).fetch('data')
  rescue KeyError
    errors = JSON.parse(response.body)['errors'].map { |err| err['message'] }
    raise "\nResponse Errors:\n#{errors.join("\n")}"
  end
end
