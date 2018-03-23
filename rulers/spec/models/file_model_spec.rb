require_relative '../spec_helper'

# require 'pry'

RSpec.describe Rulers::Model::FileModel do
  it 'instantiates' do
    filename = 'spec/fixtures/1.json'
    expected = described_class.new(filename)
    expect(expected).not_to be nil
    # binding.pry

    puts expected.hash.inspect
  end

  describe '.find' do
  end

  describe '.all' do
  end

  describe '.create' do
  end

  describe '#[]' do
  end

  describe '#[]=' do
  end
end
