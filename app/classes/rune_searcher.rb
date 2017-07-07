class RuneSearcher

  def initialize(search_params = {})
    @search_params = search_params
  end

  def set_scope runes
    @scope = runes
  end

  def scope
    @scope = RuneSearch.new(@search_params).results
  end

  def runes
    @runes ||= scope.to_a
  end

  def upgrade_items
    @upgrade_items ||= find_upgrade_items
  end

  def results
    runes.map do |rune|
      rune_upgrade_items = rune.upgrade_item_codes.map { |code| upgrade_item_for_item_code(code) }
      rune.set_items_to_upgrade(rune_upgrade_items)
      rune
    end
  end


  private
  
    def find_upgrade_items
      scope_item_codes = runes.inject([]) {|array, rune| array + rune.upgrade_item_codes }.uniq #scope.distinct(:upgrade_item_codes)
      Attachable.where(:code.in => scope_item_codes, :_type.in => Attachable.valid_types ).to_a
    end

    def upgrade_item_for_item_code(code)
      upgrade_items.find{|item| item.code == code } || (raise StandardError.new("Couldn't find item for code #{code}"))
    end

end