require 'spec_helper'

RSpec.describe Rulers::Model::SQLite3 do
  describe '.to_sql' do
    it 'handles nil' do
      expect(described_class.to_sql(nil)).to eq 'null'
    end
  end
end
