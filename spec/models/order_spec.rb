require 'rails_helper'

RSpec.describe Order, type: :model do
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

  context "When applied sale tax" do
    before do
      @order1 = create(:order, name: "Sale tax only Order")
      @order1.order_products.create(product: abook, quantity: 1)
      @order1.order_products.create(product: cd, quantity: 1)
      @order1.order_products.create(product: chocolate_bar, quantity: 1)
    end

    it "calculates tax price" do
      expect(@order1.tax_price).to eq(1.50)
    end

    it "returns right total" do
      expect(@order1.total).to eq(29.83)
    end
  end

  context "When applied only imported tax" do
    before do
      @order2 = create(:order, name: "Imported tax only Order")
      @order2.order_products.create(product: imported_box_chocolate1, quantity: 1)
      @order2.order_products.create(product: abook, quantity: 1)
    end

    it "calculates only imported tax for this order" do
      expect(@order2.tax_price).to eq(0.5)
    end

    it "returns $22.99 is total price" do
      expect(@order2.total.to_f).to eq(22.99)
    end
  end

  context "When applied both sale tax and imported tax" do
    before do
      @order3 = create(:order, name: "Both sale tax and imported tax order")
      @order3.order_products.create(product: imported_box_chocolate1, quantity: 1)
      @order3.order_products.create(product: cd, quantity: 1)
    end

    it "calculates both sale tax and imported tax" do
      expect(@order3.tax_price).to eq(2.0)
    end

    it "returns $26.99 is total price" do
      expect(@order3.total.to_f).to eq(26.99)
    end
  end

  context "Free tax" do
    before do
      @order4 = create(:order, name: "Free tax order")
      @order4.order_products.create(product: abook, quantity: 1)
      @order4.order_products.create(product: chocolate_bar, quantity: 1)
    end

    it "returns $0 tax price" do
      expect(@order4.tax_price).to eq(0)
    end

    it "returns $13.34 id total price" do
      expect(@order4.total.to_f).to eq(13.34)
    end
  end
end
