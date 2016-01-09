class BigDecimal
  def round_tax(x)
    (self.to_f * 20).ceil.round(x) / 20
  end
end