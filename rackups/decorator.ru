obj = Object.new

# decorate
def obj.call(*args) # decorator!
  [200, { 'Content-Type' => 'text/html' },
   ['Hello World!']]
end
run obj
