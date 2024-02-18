class Item < ApplicationRecord
  enum item_type: { product: 0, component: 1}
  has_many :item_modifier_groups
  has_many :modifier_groups, :through => :item_modifier_groups
end
