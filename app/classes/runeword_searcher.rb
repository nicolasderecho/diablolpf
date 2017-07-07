class RunewordSearcher

  def initialize(search_params = {})
    @search_params = search_params
  end

  def scope
    @scope ||= RunewordSearch.new(@search_params).results
  end

  def runewords
    @runewords ||= scope.to_a
  end

  def runes
    @runes ||= find_runes
  end

  def results
    runewords.map do |runeword|
      runeword_runes = runeword.rune_codes.map { |code| rune_for_rune_code(code) }
      runeword.set_runes(runeword_runes)
      runeword
    end
  end

  private

    def find_runes
      scope_rune_codes = runewords.inject([]) {|array, runeword| array + runeword.rune_codes }.uniq #scope.distinct(:rune_codes)
      RuneSearcher.new({ code_in: scope_rune_codes}).results.to_a
    end

    def rune_for_rune_code(code)
      runes.find{|rune| rune.code == code } || (raise StandardError.new("Couldn't find rune for code #{code}"))
    end

end