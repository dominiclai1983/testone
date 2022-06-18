json.property do
  json.id @product.id
  json.title @product.title
  json.description @product.description
  json.sku @product.sku
  json.price @product.price
  json.quantity @product.quantity
  json.image url_for(@product.image) if @property.image.attached?
end
