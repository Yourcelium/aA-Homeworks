require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double(:"chef") }

  subject(:sand) { Dessert.new('sand', 5, chef) }

  describe '#initialize' do
    it 'sets a type' do
      expect(sand.type).to eq('sand')
    end

    it 'sets a quantity' do
      expect(sand.quantity).to eq(5)
    end

    it 'starts ingredients as an empty array' do
      expect(sand.ingredients).to be_empty
    end

    it 'raises an argument error when given a non-integer quantity' do
      expect { Dessert.new('sand', 'sand', chef) }.to raise_error(ArgumentError)
    end
  end

  describe '#add_ingredient' do
    it 'adds an ingredient to the ingredients array' do
      sand.add_ingredient('iphone')
      expect(sand.ingredients).to eq(['iphone'])
    end
  end

  describe '#mix!' do

    it 'shuffles the ingredient array' do
      sand.add_ingredient('pinapple')
      sand.add_ingredient('apple')
      sand.add_ingredient('pen')
      sand.add_ingredient('iphone')

      expect(sand.ingredients).to match_array(['pinapple', 'apple', 'pen', 'iphone'])
      sand.mix!
      expect(sand.ingredients).not_to eq(['iphone', 'pinapple', 'apple', 'pen'])
    end
  end

  describe '#eat' do
    it 'subtracts an amount from the quantity' do
      sand.eat(1)

      expect(sand.quantity).to eq(4)
    end

    it 'raises an error if the amount is greater than the quantity' do
      expect { sand.eat(100) }.to raise_error
    end
  end

  describe '#serve' do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Great Nincompoop")

      expect(sand.serve).should eq("Great Nincompoop has made 4 sands!")
    end
  end

  describe '#make_more' do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
