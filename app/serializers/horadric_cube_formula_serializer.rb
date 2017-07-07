class HoradricCubeFormulaSerializer < ActiveModel::Serializer
  attributes  :id, :description, :items, :result

  def id
    object.id.to_s
  end

end