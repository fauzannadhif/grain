# README

## Development Process

Below points detail the development process that I went through to implement this project

* Setup development environment
First and foremost I had to setup the development environment in my PC. This includes installing ruby, installing rails, creating the rails project (`rails new grain`), and last but not least setting up the github repository in https://github.com/fauzannadhif/grain

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
