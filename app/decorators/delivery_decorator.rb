class DeliveryDecorator < Draper::Decorator
  delegate_all

  def date_delivery
    "#{min_days} to #{max_days} days"
  end
end
