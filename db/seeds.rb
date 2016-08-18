file = File.read(Rails.root.join('lib', 'seeds', 'restaurants.json'))

restaurants = JSON.parse(file)

categories = %w(Entree Appetizer Dessert Beverage Side)
streets = ["Oak", "Maple", "Walnut", "Elm"]

restaurants.each do |restaurant|
  next unless restaurant["menus"].present?

  name = restaurant["name"]
  description = restaurant["description"] || "A family dining establishment"
  rating = rand(50) / 10.0
  street = restaurant["address1"] || "#{rand(1000)} #{streets.sample} St."
  city = restaurant["locality"] || "Chicago"
  state = restaurant["region"] || "IL"
  zip = restaurant["postal_code"] || "60611"
  address = "#{street}, #{city}, #{state} #{zip}"

  r = Restaurant.create(name: name, description: description, rating: rating, address: address)
  print "-"

  sections = restaurant["menus"].collect {|menu| menu["sections"]}.flatten
  subsections = sections.collect {|menu| menu["subsections"]}.flatten
  items = subsections.collect {|menu| menu["contents"]}.flatten

  items.each do |item|
    next unless item["type"] = "ITEM"
    next unless item["name"].present?
    name = item["name"]
    description = item["description"] || "A signature special"
    category = categories.sample
    name_array = name.downcase.split(" ")
    tag_list = [name_array[0], name_array[1]]

    MenuItem.create(restaurant_id: r.id, name: name, description: description, category: category, tag_list: tag_list)
    print "."
  end
end

