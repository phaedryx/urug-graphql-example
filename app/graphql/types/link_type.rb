Types::LinkType = GraphQL::ObjectType.define do
  POPULARITY_THRESHOLD = 18
  name 'Link'

  field :id, !types.ID
  field :url, types.String
  field :created_at, !types.String
  field :updated_at, !types.String
  field :popular, types.Boolean do
    resolve ->(obj, _args, _ctx) { obj.bookmarks.count >= POPULARITY_THRESHOLD }
  end
  field :bookmarks, types[Types::BookmarkType]
  field :users, types[Types::UserType]
end
