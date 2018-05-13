RSpec.describe Rulers do
  it "has a version number" do
    expect(Rulers::VERSION).not_to be nil
  end

  describe Rulers::Application do
    describe '.new' do
      it 'instantiates' do
        expect(Rulers::Application.new).to_not be_nil
      end
    end

    describe '#call' do
      it '' do
        env = { 'PATH_INFO' => '/favicon.ico' }
        app = Rulers::Application.new
        expected = [404, {"Content-Type"=>"text/html"}, []]

        expect(app.call(env)).to eq expected
      end
    end
  end
end
