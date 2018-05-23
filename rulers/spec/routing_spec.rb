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
        routing.instance_eval do
          # a route here
        end
        result = routing.check_url('')
        expect(result).to eq 2
      end

      it '/' do
        routing = RouteObject.new
        result = routing.check_url('/')
        expect(result).to eq 2
      end

      it '/foobar' do
        routing = RouteObject.new
        result = routing.check_url('/foobar')
        expect(result).to eq 2
      end

      it 'http://foobar.com' do
        routing = RouteObject.new
        result = routing.check_url('http://foobar.com')
        expect(result).to eq 2
      end
    end

    describe '#get_dest' do
      it '' do
        routing = RouteObject.new
        # result = routing.get_dest('sdfgdf')
        result = routing.get_dest('quotes#bar')
        expect(result).to eq ''
      end

      it 'cannot load unknown controller' do
        routing = RouteObject.new
        expect do
          result = routing.get_dest('foo#bar')
        end.to raise_error(LoadError)
      end
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
