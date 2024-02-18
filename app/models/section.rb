class Section < ApplicationRecord
  has_many :section_items
  has_many :items, -> { order 'section_items.display_order' }, :through => :section_items
end
