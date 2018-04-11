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
