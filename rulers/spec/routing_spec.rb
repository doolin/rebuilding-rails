module Rulers
  RSpec.describe RouteObject do
=begin
app.route do
  match '', 'quotes#index'
  match 'sub-app',
    proc { [200, {}, ['Hello, sub-app!']] }

  # default routes
  match ':controller/:id/:action'
  match ':controller/:id',
    default: { 'action' => 'show' }
  match ':controller',
    default: { 'action' => 'index' }
end
=end

    describe '#check_url' do
      it '' do
        routing = RouteObject.new
      end
    end

    describe '#get_dest' do
    end

    describe 'match' do
      it '' do
        router = RouteObject.new
        result = router.match('')
        expected = [
          {
            :regexp=>/^\/$/,
            :vars=>[],
            :dest=>nil,
            :options=>{:default=>{}}
          }
        ]
        expect(result).to eq expected
      end

      it ':controller' do
        router = RouteObject.new
        result = router.match('foobar')
        expected = [
          {
            :regexp=>/^\/foobar$/,
            :vars=>[],
            :dest=>nil,
            :options=>{:default=>{}}
          }
        ]
        expect(result).to eq expected
      end

    end
  end
end
