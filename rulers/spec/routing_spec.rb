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
          match ':controller/:id/:action'
        end
        binding.pry
        url = '/foo/3/bar'
        result = routing.check_url(url)
        expect(result).to eq 3
      end

      it '' do
        routing = RouteObject.new
        routing.instance_eval do
          match '', 'quotes#index'
        end
        result = routing.check_url('')
        expect(result).to be nil
      end

      it '/' do
        routing = RouteObject.new
          routing.instance_eval do
            match '/', 'quotes#index'
          end

        binding.pry
        expected = 'quotes_controller'
        expect(routing).to receive(:get_dest).and_return(expected)
        result = routing.check_url('/')
        expect(result).to eq expected
      end

      it '/foobar' do
        routing = RouteObject.new
        result = routing.check_url('/foobar')
        expect(result).to eq 2
      end

      it '/foobar' do
        url = '/foobar'
        routing = RouteObject.new
        # TODO: the url seems to be getting mangled in the match method.
        # Command line investigation shows a problem.
        routing.instance_eval do
          match '/foobar', 'quotes#index'
        end
        expected = 'quotes_controller'
        expect(routing).to receive(:get_dest).and_return(expected)
        result = routing.check_url(url)
        expect(result).to eq expected
      end
    end

    describe '#get_dest' do
      it 'loads a known controller' do
        routing = RouteObject.new
        expected = 'quotes_controller'
        expect(routing).to receive(:get_dest).and_return(expected)
        result = routing.get_dest('quotes#bar')

        expect(result).to eq expected
      end

      it 'cannot load unknown controller' do
        routing = RouteObject.new
        expect do
          result = routing.get_dest('foo#bar')
        end.to raise_error(LoadError, 'cannot load such file -- foo_controller')
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
