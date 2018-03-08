require 'json'

class QuotesController < Rulers::Controller
  def index
    quotes = FileModel.all
    render :index, quotes: quotes
  end

  def show
    quote = FileModel.find(params['id'])
    ua = request.user_agent
    render :quote, obj: quote, ua: ua
  end

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

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, obj: quote_1
  end

  def new_quote
    attrs = {
      'submitter' => 'web user',
      'quote' => 'A picture is worth 1 k words',
      'attribition' => 'Rebuilding Rails'
    }
    m = FileModel.create(attrs)
    render :quote, obj: m
  end
end
