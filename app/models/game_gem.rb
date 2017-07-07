class GameGem < Attachable

  field :gem_type, type: String

  module TYPES
    AMETHYST = "amethyst"
    DIAMOND  = "diamond"
    EMERALD  = "emerald"
    RUBY     = "ruby"
    SAPPHIRE = "sapphire"
    SKULL    = "skull"
    TOPAZ    = "topaz"
    ALL      = [AMETHYST, DIAMOND, EMERALD, RUBY, SAPPHIRE, SKULL, TOPAZ]
  end

  module PARTS
    CHIPPED  = "chipped"
    FLAWED   = "flawed"
    NORMAL   = "normal"
    FLAWLESS = "flawless"
    PERFECT  = "perfect"
    ALL = [CHIPPED, FLAWED, NORMAL, FLAWLESS, PERFECT]
  end


  def image_path(image_name = nil)
    image_name = image_name.presence || calculated_image_name
    super("#{image_name}.#{image_extension}")
  end

  def calculated_image_name
    code.split("-").reject {|a| a.downcase == "normal"}.reverse.join("_")
  end

  def image_extension
    'gif'
  end

  def self.names
    TYPES::ALL
  end

  def self.types
    [{gem_type: TYPES::AMETHYST, name: "Amatista"},
     {gem_type: TYPES::DIAMOND, name: "Diamante"},
     {gem_type: TYPES::EMERALD, name: "Esmeralda"},
     {gem_type: TYPES::RUBY, name: "Rubí"},
     {gem_type: TYPES::SAPPHIRE, name: "Zafiro"},
     {gem_type: TYPES::SKULL, name: "Cráneo"},
     {gem_type: TYPES::TOPAZ, name: "Topacio"}]
  end

end