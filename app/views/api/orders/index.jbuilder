json.orders do
  json.array! @orders do |order|
    json.id order.id
    json.date order.order_date
  end
end
