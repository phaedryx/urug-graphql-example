class Functions::AllFunction < GraphQL::Function
  description 'Retrieve all resources'

  attr_reader :model_class

  def initialize(model_class)
    @model_class = model_class
  end

  def call(_obj, _args, _ctx)
    @model_class.all
  end
end
