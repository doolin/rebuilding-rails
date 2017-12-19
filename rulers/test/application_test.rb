require_relative './test_helper'

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/'
    assert last_response.ok?
    body = last_response.body
    assert body['Hello']
  end

  def test_random
    get '/random'
    assert last_response.ok?
    assert last_response.original_headers.keys.include?('Content-Type')
  end
end
