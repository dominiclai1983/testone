json.total_pages @products.total_pages
json.next_page @products.next_page

json.products do
  json.array! @products do |property|
    json.id product.id
    json.description product.description
    #set the lenght of the character at frontend
    json.sku product.sku
    json.price product.price

    if product.image.variant?
      json.image url_for(product.image.variant(:thumb))
    else
      json.image nil
    end
  end
end
