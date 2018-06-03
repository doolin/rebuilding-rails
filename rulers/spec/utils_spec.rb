RSpec.describe Rulers do
  describe '.to_underscore' do
    example 'trivial case' do
      expect(Rulers.to_underscore('foo')).to eq 'foo'
    end

    example 'FooBar' do
      expect(Rulers.to_underscore('FooBar')).to eq 'foo_bar'
    end

    example 'BOBSays' do
      expect(Rulers.to_underscore('BOBSays')).to eq 'bob_says'
    end

    example 'Bob::Says' do
      expect(Rulers.to_underscore('Bob::Says')).to eq 'bob/says'
    end

    example 'a7D' do
      expect(Rulers.to_underscore('a7D')).to eq 'a7_d'
    end
  end
end
