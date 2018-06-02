require 'spec_helper'

RSpec.describe HomeController do
  describe '.new' do
    it 'instantiates' do
      env = :test
      expect(HomeController.new(env)).not_to be nil
    end
  end

  describe '#index' do
    it 'works correctly' do
      env = :test
      expected = 'index action'
      expect(HomeController.new(env).index).to eq expected
    end
  end
end
