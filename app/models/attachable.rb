class Attachable < Item

  field :image, type: String
  field :weapons, type: Array
  field :shields, type: Array
  field :armors, type: Array
  field :helms, type: Array
  
  def image_path(image_name = nil)
    image_name = image_name.presence || "#{code}.png"
    ENV["HOST_PREFIX"].to_s + ENV["HOST"].to_s + ActionController::Base.helpers.asset_url("seed/#{self.class.to_s.underscore.pluralize}/#{image_name}")
  end

  def image_base64
    image_name = image_name.presence || calculated_image_name
    image_full_path = Rails.root.join('app','assets', 'images', "seed/#{self.class.to_s.underscore.pluralize}/#{image_name}.#{image_extension}").to_s
    Base64.encode64(File.open(image_full_path).read)
  end

  def calculated_image_name
    code
  end

  def image_extension
    'png'
  end

  def serializer
    "#{_type}Serializer".constantize
  end

  def self.valid_types
    ["Rune", "GameGem", "Attachable"]
  end

end