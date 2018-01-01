require 'pry'
require 'json'

class QuotesController < Rulers::Controller
  def a_quote
    env[:quote] = 'There is nothing good or bad but thinking makes it so.'
    "\n<pre>\n#{env.to_json}\n</pre>"
  end

  def exception
    raise "It's a bad one!"
  end
end
