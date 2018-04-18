INNER_LAYER = proc {
  'world'
}

OUTER_LAYER = proc do
  inner_content = INNER_LAYER.call
  [200, { 'Content-Type' => 'text/html' },
   ['Hello, ', + inner_content]]
end
run OUTER_LAYER
