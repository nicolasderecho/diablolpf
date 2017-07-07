class RuneSearch < Searchlight::Search

  def base_query
    Rune.order_by(position: :asc)
  end

  def search_name
    query.where(name: Regexp.new(Regexp.quote(name), "i"))
  end

  def search_level
    query.where(level: level)
  end

  def search_weapon_contains
    query.where(weapons: Regexp.new(Regexp.quote(weapon_contains), "i"))
  end

  def search_shield_contains
    query.where(shields: Regexp.new(Regexp.quote(shield_contains), "i"))
  end

  def search_code_in
    query.where(code: { '$in': code_in })
  end

end