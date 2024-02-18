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
  },
  {
    identifier: 'S1',
    label: 'Sides',
    description: 'side dishes'
  }
]

SECTIONS.each do |section|
  record = Section.create!(
    identifier: section[:identifier],
    label: section[:label],
    description: section[:description],
  )
  puts "Section #{record[:identifier]} is successfully inserted"
end

MENU_SECTION = [
  {
    menu: Menu.find_by(identifier: 'M0'),
    section: Section.find_by(identifier: 'S0'),
    display_order: 0
  },
  {
    menu: Menu.find_by(identifier: 'M0'),
    section: Section.find_by(identifier: 'S1'),
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
  },
  {
    item_type: :component,
    identifier: 'I1',
    label: 'Extra Cheese',
    description: 'extra cheese topping',
    price: 3.0
  },
  {
    item_type: :component,
    identifier: 'I2',
    label: 'Extra Pepperoni',
    description: 'extra pepperoni topping',
    price: 5.5
  },
  {
    item_type: :component,
    identifier: 'I3',
    label: 'Extra Mushroom',
    description: 'extra mushroom topping',
    price: 2.5
  },
  {
    item_type: :product,
    identifier: 'I4',
    label: 'Chicken Wings',
    description: 'Oven-backed chicken wings',
    price: 10.2
  },
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
  },
  {
    section: Section.find_by(identifier: 'S1'),
    item: Item.find_by(identifier: 'I4'),
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

MODIFIER_GROUPS = [
  {
    identifier: 'MG0',
    label: 'Extra Topping',
    selection_required_min: 0,
    selection_required_max: 3
  }
]

MODIFIER_GROUPS.each do |modifier_group|
  record = ModifierGroup.create!(
    identifier: modifier_group[:identifier],
    label: modifier_group[:label],
    selection_required_min: modifier_group[:selection_required_min],
    selection_required_max: modifier_group[:selection_required_max]
  )
  puts "Modifier Group #{record[:identifier]} is successfully inserted"
end

ITEM_MODIFIER_GROUPS = [
  {
    item: Item.find_by(identifier: 'I0'),
    modifier_group: ModifierGroup.find_by(identifier: 'MG0'),
  }
]

ITEM_MODIFIER_GROUPS.each do |item_modifier_group|
  record = ItemModifierGroup.create!(
    item: item_modifier_group[:item],
    modifier_group: item_modifier_group[:modifier_group],
  )
end

MODIFIERS = [
  {
    item: Item.find_by(identifier: 'I1'),
    modifier_group: ModifierGroup.find_by(identifier: 'MG0'),
    display_order: 0,
    default_quantity: 0,
    price_override: 3.0
  },
  {
    item: Item.find_by(identifier: 'I2'),
    modifier_group: ModifierGroup.find_by(identifier: 'MG0'),
    display_order: 0,
    default_quantity: 0,
    price_override: 5.5
  },
  {
    item: Item.find_by(identifier: 'I3'),
    modifier_group: ModifierGroup.find_by(identifier: 'MG0'),
    display_order: 0,
    default_quantity: 0,
    price_override: 2.5
  }
]

MODIFIERS.each do |modifier|
  record = Modifier.create!(
    item: modifier[:item],
    modifier_group: modifier[:modifier_group],
    display_order: modifier[:display_order],
    default_quantity: modifier[:default_quantity],
    price_override: modifier[:price_override]
  )
end