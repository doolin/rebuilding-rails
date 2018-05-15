RSpec.describe Rulers do
  it "has a version number" do
    expect(Rulers::VERSION).not_to be nil
  end

  describe Rulers::Application do
    subject(:application) { Rulers::Application.new }

    describe '.new' do
      it 'instantiates' do
        expect(application).to_not be_nil
      end
    end

    describe '#call' do
      it 'returns 404 for favicon' do
        env = { 'PATH_INFO' => '/favicon.ico' }
        expected = [404, {"Content-Type"=>"text/html"}, []]

        expect(application.call(env)).to eq expected
      end

      xit 'calls rack_app' do
        env = { 'FOO' => '/bar' }
        expected = []

        expect(application.call(env)).to eq expected
      end
    end
  end
end
