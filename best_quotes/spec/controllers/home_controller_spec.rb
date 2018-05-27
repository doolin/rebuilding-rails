require 'spec_helper'

RSpec.describe HomeController do
  describe '.new' do
    it 'instantiates' do
      env = :test
      expect(HomeController.new(env)).not_to be nil
    end
  end
end
