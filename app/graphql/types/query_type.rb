# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :menus, [Types::MenuType], null: false, description: "Return a list of menus"
  
    def menus
      Menu.all
    end

    field :menu, Types::MenuType, null: false do
      description 'Find a menu by ID'
      argument :id, ID, required: true
    end

    def menu(id:)
      Menu.find(id)
    end


    field :sections, [Types::SectionType], null: false, description: "Return a list of sections"
  
    def sections
      Section.all
    end

    field :section, Types::SectionType, null: false do
      description 'Find a section by ID'
      argument :id, ID, required: true
    end

    def section(id:)
      Section.find(id)
    end

    field :items, [Types::ItemType], null: false, description: "Return a list of items"
  
    def items
      Item.all
    end

    field :item, Types::ItemType, null: false do
      description 'Find an item by ID'
      argument :id, ID, required: true
    end

    def item(id:)
      Item.find(id)
    end

    field :modifier_groups, [Types::ModifierGroupType], null: false, description: "Return a list of modifier groups"
  
    def modifier_groups
      ModifierGroup.all
    end

    field :modifier_group, Types::ModifierGroupType, null: false do
      description 'Find a modifier group by ID'
      argument :id, ID, required: true
    end

    def modifier_group(id:)
      ModifierGroup.find(id)
    end

    field :modifiers, [Types::ModifierType], null: false, description: "Return a list of modifiers"
  
    def modifiers
      Modifier.all
    end

    field :modifier, Types::ModifierType, null: false do
      description 'Find a modifier by ID'
      argument :id, ID, required: true
    end

    def modifier(id:)
      Modifier.find(id)
    end
  end
end
