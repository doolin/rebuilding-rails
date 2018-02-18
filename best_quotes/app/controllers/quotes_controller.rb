# require 'pry'
require 'json'

class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, noun: :winking
  end

  def environment
    env[:quote] = 'There is nothing good or bad but thinking makes it so.'
    "\n<pre>\n#{env.to_json}\n</pre>"
  end

  def exception
    raise "It's a bad one!"
  end
end
