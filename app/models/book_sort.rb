class BookSort < ApplicationRecord

  def newest
    sort.order(updated_at: :desc)
  end

  def popular
  end

  def price_low_to_high
    sort.order(price: :desc)
  end

  def price_high_to_low
    sort.order(price: :asc)
  end

  def title_a_z
    sort.order(name: :desc)
  end

  def title_z_a
    sort.order(name: :asc)
  end

end
