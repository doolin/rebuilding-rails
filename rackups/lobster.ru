require 'rack/lobster'

use Rack::ContentType

map '/lobster' do
  use Rack::ShowExceptions
  run Rack::Lobster.new
end

map '/lobster/but_not' do
  run proc {
    [200, {}, ['Really not a lobster']]
  }
end

run proc {
  [200, {}, ['Not a lobster']]
}
