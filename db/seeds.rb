# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

MENUS = [
  {
    identifier: 'M0',
    label: 'Pizza',
    state: 'Active',
    start_date: DateTime.new(2024, 1, 1),
    end_date: DateTime.new(2025, 1, 1)
  }
]

MENUS.each do |menu|
  record = Menu.create!(
    identifier: menu[:identifier],
    label: menu[:label],
    state: menu[:state],
    start_date: menu[:start_date],
    end_date: menu[:end_date]
  )
  puts "Menu #{record[:identifier]} is successfully inserted"
end

SECTIONS = [
  {
    identifier: 'S0',
    label: 'Classic Pizzas',
    description: 'classic flavored pizzas'
  }
]

SECTIONS.each do |section|
  record = Section.create!(
    identifier: section[:identifier],
    label: section[:label],
    description: section[:state],
  )
  puts "Section #{record[:identifier]} is successfully inserted"
end

MENU_SECTION = [
  {
    menu: Menu.find_by(identifier: 'M0'),
    section: Section.find_by(identifier: 'S0'),
    display_order: 0
  }
]

MENU_SECTION.each do |menu_section|
  record = MenuSection.create!(
    menu: menu_section[:menu],
    section: menu_section[:section],
    display_order: menu_section[:display_order],
  )
end

ITEMS = [
  {
    item_type: :product,
    identifier: 'I0',
    label: 'Pepperoni Pizza',
    description: 'classic pepperoni pizzas',
    price: 20.0
  }
]

ITEMS.each do |item|
  record = Item.create!(
    item_type: item[:item_type],
    identifier: item[:identifier],
    label: item[:label],
    description: item[:description],
    price: item[:price]
  )
  puts "Item #{record[:identifier]} is successfully inserted"
end

SECTION_ITEM = [
  {
    section: Section.find_by(identifier: 'S0'),
    item: Item.find_by(identifier: 'I0'),
    display_order: 0
  }
]

SECTION_ITEM.each do |section_item|
  record = SectionItem.create!(
    section: section_item[:section],
    item: section_item[:item],
    display_order: section_item[:display_order],
  )
end