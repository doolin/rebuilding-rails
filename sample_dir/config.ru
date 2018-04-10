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
