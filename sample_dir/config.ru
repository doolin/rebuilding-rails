# initial example
#
# run proc {
#  [200, { 'Content-Type' => 'text/html' },
#    ['Hello World!']]
# }

# second example
obj = Object.new

def obj.call(*args) # decorator!
  [200, { 'Content-Type' => 'text/html' },
   ['Hello World!']]
end
run obj

INNER_LAYER = proc {
  'world'
}

OUTER_LAYER = proc do
  inner_content = INNER_LAYER.call
  [200, { 'Content-Type' => 'text/html' },
   ['Hello, ', + inner_content]]
end
run OUTER_LAYER

use Rack::Auth::Basic, 'app' do |_, pass|
  'secret' == pass
end
run proc {
  [200, { 'Content-Type' => 'text/html' },
    ['Hello World!']]
}

class Canadianize
  def initialize(app, arg = "")
    @app = app
    @arg = arg
  end

  def call(env)
    status, headers, content = @app.call(env)
    content[0] = += @arg + ", eh?"
    [status, headers, content]
  end

  use Canadianize, ", simple"
end
run proc {
  [200, { 'Content-Type' => 'text/html' },
    ['Hello world']]
}


