class Item < ApplicationRecord
  enum type: [ :product, :component ]
  has_many: modifier_groups, :through => :item_modifier_groups
end
