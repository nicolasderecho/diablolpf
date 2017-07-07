class GameGemSerializer < ActiveModel::Serializer
  attributes  :level, :id, :name, :weapons, :shields, :image_path, :gem_type, :armors

  def id
    object.id.to_s
  end

end