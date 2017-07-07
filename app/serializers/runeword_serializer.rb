class RunewordSerializer < ActiveModel::Serializer
  attributes  :holes, :level, :id, :name, :code, :specs, :applicable_in, :runes

  def runes
    object.runes.map { |rune| RuneSerializer.new(rune) }
  end

  def id
    object.id.to_s
  end

end