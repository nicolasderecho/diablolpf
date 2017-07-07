class GameGemSearch < Searchlight::Search

  def base_query
    GameGem.order_by(position: :asc)
  end

  def search_name
    query.where(name: Regexp.new(Regexp.quote(name), "i"))
  end

  def search_level
    query.where(level: level)
  end

  def search_gem_type_in
    query.where(gem_type: { '$in': gem_type_in })
  end

  def search_armor_contains
    query.where(armors: Regexp.new(Regexp.quote(armor_contains), "i"))
  end

  def search_weapon_contains
    query.where(weapons: Regexp.new(Regexp.quote(weapon_contains), "i"))
  end

  def search_shield_contains
    query.where(shields: Regexp.new(Regexp.quote(shield_contains), "i"))
  end


end