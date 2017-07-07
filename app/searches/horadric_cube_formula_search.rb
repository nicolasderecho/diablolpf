class HoradricCubeFormulaSearch < Searchlight::Search

  def base_query
    HoradricCubeFormula.all
  end

  def search_result
    query.where(result: Regexp.new(Regexp.quote(result), "i"))
  end

  def search_description
    query.where(description: Regexp.new(Regexp.quote(description), "i"))
  end

  def search_items_contains
    query.where(items: Regexp.new(Regexp.quote(items_contains), "i") )
  end

end