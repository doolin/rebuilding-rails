RSpec.describe Rulers do
  describe '.to_underscore' do
    example 'trivial case' do
      expect(Rulers.to_underscore('foo')).to eq 'foo'
    end

    example 'FooBar' do
      expect(Rulers.to_underscore('FooBar')).to eq 'foo_bar'
    end
  end
end
