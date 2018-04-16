class Canadianize
  def initialize(app, arg = "")
    @app = app
    @arg = arg
  end

  def call(env)
    status, headers, content = @app.call(env)
    content[0] += @arg + ", eh?"
    [status, headers, content]
  end

end

use Canadianize, ", simple"

run proc {
  [200, { 'Content-Type' => 'text/html' },
    ['Hello world']]
}
