Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # you can inline resolver functions as procs
  field :user, Types::UserType do
    argument :id, !types.ID, 'The ID of the resource to retrieve'

    resolve ->(_obj, args, _ctx) { User.find(args[:id]) }
  end

  # but it is usually more effective to extract the behavior into
  # a resolver function object that can be re-used (and tested)
  field :link, Types::LinkType, function: Functions::FindFunction.new(Link)
  field :bookmark, Types::BookmarkType, function: Functions::FindFunction.new(Bookmark)
end
