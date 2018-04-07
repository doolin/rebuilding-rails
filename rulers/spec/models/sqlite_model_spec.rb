require 'spec_helper'

RSpec.describe Rulers::Model::SQLite3 do
  describe '.to_sql' do
    it 'handles nil' do
      expect(described_class.to_sql(nil)).to eq 'null'
    end

    it 'returns string for number' do
      expect(described_class.to_sql(3)).to eq '3'
    end
  end
end
