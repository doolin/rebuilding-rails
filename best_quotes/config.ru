require_relative 'config/application'

use Rack::ContentType

class BenchMarker
  def initialize(app, runs = 100)
    @app, @runs = app, runs
  end

  def call(env)
    t = Time.now

    result = nil
    @runs.times { result = @app.call(env) }

    t2 = Time.now - t
    STDERR.puts <<-OUTPUT
    Benchmark:
    #{@runs} runs
    #{t2.to_f} seconds total
    #{t2.to_f * 1000.0/ @runs} millisec/run
    OUTPUT

    result
  end
end
use BenchMarker, 1

require './config/application'

map '/' do
  run QuotesController.action(:index)
end

run BestQuotes::Application.new
