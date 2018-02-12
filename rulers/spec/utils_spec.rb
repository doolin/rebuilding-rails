RSpec.describe Rulers do
  describe '.to_underscore' do
    it 'trivial case' do
      expect(Rulers.to_underscore('foo')).to eq 'foo'
    end
  end
end
