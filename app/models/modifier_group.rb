class ModifierGroup < ApplicationRecord
  has_many :modifiers, -> { order 'modifiers.display_order' }
end
