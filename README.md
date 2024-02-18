# README

## Setup

* Create, migrate, and seed db

  Run `rails db:create db:migrate db:seed`

* Runs rails server

  Run `rails s`

*  Open up GraphiQL

  Open up http://localhost:3000/graphiql in your browser.

## Development Process

Below points detail the development process that I went through to implement this project.

* Setup development environment

  First and foremost I had to setup the development environment in my PC. This includes installing ruby, installing rails, creating the rails project (`rails new grain`), and last but not least setting up the github repository in https://github.com/fauzannadhif/grain.
  (Estimated time spent: 30 mins)

* Creating models and associations

  The second step would be to create the models as already described in the Entity Relationship Diagram. In rails this can be done simply by running the command `rails g model ModelName` . For example, to create `Menu` model, we can run `rails g model Menu identifier label state start_date:date end_date:date`. Now we just need to run this for all models in the ERD.
  After creating the model, we also have to setup the associations between the model. The important association here is the one-to-many relations that exist between Menu and Section, Section and Item, etc. This can be done by using the has_many association. For example:
  ```
  class Menu < ApplicationRecord
      has_many :menu_sections
      has_many :sections, :through => :menu_sections
  end
  ```
  We also have to consider the `display_order`. We can do this using order scope blocks. Adding on from above example, it becomes like this:
  ```
  class Menu < ApplicationRecord
      has_many :menu_sections
      has_many :sections, -> { order 'menu_sections.display_order' }, :through => :menu_sections
  end
  ```
  (Estimated time spent: 1 hours 30 mins)

* Creating Graphql queries

  The third step is to create the GraphQL queries. With rails, this can be done easily by first installing graphql `bundle add graphql `, and running the generator `rails generate graphql:install`. This will automatically creates all the files with boilerplate code. After that, we can add the types by running `rails g graphql:object model`. This will generate the file `model_type.rb`. And we will want to add some additional fields in this file. For example, we want to add `sections` in `MenuType`. We can do it like this:
  ```
  module Types
    class MenuType < Types::BaseObject
      field :id, ID, null: false
      field :identifier, String
      field :label, String
      field :state, String
      field :start_date, GraphQL::Types::ISO8601Date
      field :end_date, GraphQL::Types::ISO8601Date
      field :sections, [Types::SectionType], null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
  ```
  This will enable us to get `sections` when querying for `menus`.
  After that, we can add the queries in the `query_type.rb` file. We want to add the query for each model. For example:
  ```
  field :menus, [Types::MenuType], null: false, description: "Return a list of menus"

      def menus
          Menu.all
      end
  ```
  (Estimated time spent: 2 hours)

* Seed Database

  We will need to add some pre-generated data in our database to test our endpoints. This can be done by modifying the `db/seeds.rb` file.
  (Estimated time spent: 1 hour)

* Write this documentation

  The last but not the least step was for me to write this README :). This is to document my thought process and approach to this project.
  (Estimated time spent: 30 minutes)

(Total estimated time spent: 5 hours 30 mins)


## GraphQL Query

Below are some examples of the available GraphQl queries to use as reference:

Get All Menus:

```
{
  menus {
    id
    identifier
    label
    state
    startDate
    endDate
    sections {
      id
      identifier
      label
      description
      items {
        id
        itemType
        identifier
        label
        description
        price
        modifierGroups {
          id
          identifier
          label
          selectionRequiredMin
          selectionRequiredMax
          modifiers {
            id
            item {
              id
              itemType
              identifier
              label
              description
              price
            }
            priceOverride
          }
        }
      }
    }
    createdAt
    updatedAt
  }
}
```

Get Menu by ID:

```
{
  menu(id: 1) {
    id
  }
}
```
