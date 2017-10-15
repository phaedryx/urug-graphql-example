Types::BookmarkType = GraphQL::ObjectType.define do
  name 'Bookmark'
  description 'a representation of a user saving a link'

  field :id, !types.ID
  field :created_at, !types.String
  field :updated_at, !types.String

  field :description, types.String
  field :user, Types::UserType
  field :link, Types::LinkType
end
