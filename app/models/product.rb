class Product < ActiveRecord::Base
  belongs_to :category

  module TAX
    SALE = 0.1
    IMPORTED = 0.05
  end

  def tax_rate
    sale_tax + imported_tax
  rescue StandardError => error
    puts error.message

    return 0
  end

  def sale_tax
    tax_exempts.include?(self.category.try(:name)) ? 0 : TAX::SALE
  end

  def imported_tax
    self.imported? ? TAX::IMPORTED : 0
  end

  def tax_price
    (self.price * tax_rate).round_tax(2)
  end

  def price_after_tax
    self.price + tax_price
  end

  def tax_exempts
    ['Book', 'Food', 'Medical']
  end
end
