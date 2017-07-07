class HoradricCubeFormula
  include Mongoid::Document

  field :items, type: Array
  field :result, type: String
  field :description, type: String

end