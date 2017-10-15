# type definition
#
# type User {
#   id: ID!
#   email: String
#   first_name: String
#   last_name: String
#   full_name: String
#   created_at: String!
#   updated_at: String!
#
#   bookmarks: [Bookmark]
#   links: [Link]
# }

Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'a social bookmark creator'

  field :id, !types.ID
  field :email, types.String
  field :first_name, types.String
  field :last_name, types.String
  field :full_name, types.String
  field :created_at, !types.String
  field :updated_at, !types.String

  field :bookmarks, types[Types::BookmarkType]
  field :links, types[Types::LinkType]
end
