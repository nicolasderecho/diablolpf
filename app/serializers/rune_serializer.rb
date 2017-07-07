class RuneSerializer < ActiveModel::Serializer
  attributes  :position, :level, :id, :name, :weapons, :shields, :image_path, :items_to_upgrade

  def items_to_upgrade
    if instance_options[:is_item_to_upgrade]
      []
    else
      object.items_to_upgrade.map { |item| item.serializer.new(item, is_item_to_upgrade: true).as_json }
    end
  end

  def id
    object.id.to_s
  end

end