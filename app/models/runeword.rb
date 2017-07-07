class Runeword < Item

  field :specs, type: Array
  field :rune_codes, type: Array
  field :applicable_in, type: Array
  field :holes, type: Integer
  
  def runes
    @runes || set_runes(runes_for_runeword)
  end

  def self.applicableWeapons
    Runeword.distinct(:applicable_in).sort
  end

  def self.holes
    [2,3,4,5,6]
  end

  def set_runes(runes_list)
    @runes = runes_list
  end

  def runes_for_runeword
    items = Rune.where(:code.in => rune_codes).to_a
    rune_codes.map { |code| items.find { |item| item.code == code } }
  end

end