Types::LinkType = GraphQL::ObjectType.define do
  name 'Link'

  field :id, !types.ID
  field :url, types.String
  field :created_at, !types.String
  field :updated_at, !types.String

  field :bookmarks, types[Types::BookmarkType]
  field :users, types[Types::UserType]
end
