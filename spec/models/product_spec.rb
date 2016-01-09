require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should belong_to(:category) }

  let!(:book) { create(:category, name: 'Book')}
  let!(:food) { create(:category, name: 'Food')}
  let!(:medical) { create(:category, name: 'Medical')}
  let!(:perfume) { create(:category, name: 'Perfume')}
  let!(:entertainment) { create(:category, name: 'Entertainment')}

  let!(:abook) { create(:product, category: book, name: 'A book', price: 12.49) }
  let!(:cd) { create(:product, category: entertainment, name: 'Music cd', price: 14.99) }
  let!(:chocolate_bar) { create(:product, category: food, name: 'Chocolate bar', price: 0.85) }
  let!(:imported_box_chocolate1) { create(:product, category: food, name: 'imported box of chocolates', price: 10.00, imported: true) }
  let!(:imported_bottle_perfume1) { create(:product, category: perfume, name: 'imported bottle of perfume', price: 47.50, imported: true) }
  let!(:imported_bottle_perfume2) { create(:product, category: perfume, name: 'imported bottle of perfume', price: 27.99, imported: true) }
  let!(:bottle_perfume) { create(:product, category: perfume, name: 'bottle of perfume', price: 18.99) }
  let!(:headache_pills) { create(:product, category: medical, name: 'packet of headache pills', price: 9.75) }
  let!(:imported_box_chocolate2) { create(:product, category: food, name: 'box of imported chocolates', price: 11.25, imported: true) }


  context "#sale_tax" do
    it "returns 0 for Book , Food, Medical" do
      expect(abook.sale_tax).to eq(0)
      expect(chocolate_bar.sale_tax).to eq(0)
      expect(headache_pills.sale_tax).to eq(0)
    end

    it "returns 0 on imported foods also" do
      expect(imported_box_chocolate1.sale_tax).to eq(0)
    end

    it "returns sale tax price on perfume" do
      expect(bottle_perfume.sale_tax).to eq(0.1)
    end
  end

  context "#imported_tax" do
    it "returns 0 on products not imported" do
      expect(abook.imported_tax).to eq(0)
    end

    it "returns imported tax value on imported products" do
      expect(imported_box_chocolate2.imported_tax).to eq(0.05)
      expect(imported_bottle_perfume1.imported_tax).to eq(0.05)
    end
  end

  context "#tax_price" do
    it "returns sum of sale tax and imported tax" do
      expect(imported_bottle_perfume1.imported_tax + imported_bottle_perfume1.sale_tax).to eq(imported_bottle_perfume1.tax_rate)
    end

    it "rounds 2 fot value after calculated" do
      expect(imported_bottle_perfume1.tax_price).to eq(7.15)
    end
  end
end
