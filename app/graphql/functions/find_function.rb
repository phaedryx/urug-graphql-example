class Functions::FindFunction < GraphQL::Function
  description 'Retrieve a resource by ID'
  argument :id, !types.ID, 'The ID of the resource to retrieve'

  attr_reader :model_class

  def initialize(model_class)
    @model_class = model_class
  end

  def call(_obj, args, _ctx)
    @model_class.find(args[:id])
  end
end
