class RunewordSearch < Searchlight::Search

  def base_query
    Runeword.order_by(holes: :asc, level: :asc)
  end

  def search_name
    query.where(name: Regexp.new(Regexp.quote(name), "i"))
  end

  def search_code
    query.where(code: Regexp.new(Regexp.quote(code), "i"))
  end

  def search_level
    query.where(level: level)
  end

  def search_holes
    query.where(holes: holes)
  end

  def search_rune_codes_contains
    query.where(rune_codes: { "$all": rune_codes_contains } )
  end

  def search_applicable_in
    query.where(applicable_in: { "$all": applicable_in } )
  end

end