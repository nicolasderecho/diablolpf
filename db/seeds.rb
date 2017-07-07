raw_data = DataLoader.all

raw_data[:gems].each do |gem_attributes|
  unless GameGem.where({code: gem_attributes[:code]}).exists?
    game_gem = GameGem.new gem_attributes.reject{ |key, value| key == "image" } 
    game_gem.image = File.open Rails.root.join("app", "assets", "images", "seed", "game_gems", "#{game_gem.code.split('-').reject{|a| a == 'normal'}.reverse.join('_').gsub('normal','')}.gif").to_s 
    game_gem.helms = game_gem.armors
    game_gem.gem_type = game_gem.code.split("-").first
    game_gem.save!
    puts "Gem #{gem_attributes[:code]} created"
  end
end

raw_data[:runes].each do |rune_attributes|
  unless Rune.where(name: rune_attributes[:name]).exists?
    rune = Rune.new rune_attributes.reject{ |key, value| key == "image"}
    rune.code = rune.name.downcase.strip
    rune.image = File.open Rails.root.join("app", "assets", "images", "seed", "runes", "#{rune.code}.png").to_s 
    rune.save!
    puts "Rune #{rune_attributes[:name]} created"
  end
end

raw_data[:runewords].each do |runeword_attributes|
  next if Runeword.where(code: runeword_attributes[:code]).exists?
  runeword = Runeword.new(runeword_attributes)
  runeword.save!
  puts "Runeword #{runeword.code} created"
end

raw_data[:formulas].each do |formula_attributes|
  next if HoradricCubeFormula.where(items: formula_attributes[:formula]).exists?
  formula = HoradricCubeFormula.new
  formula.items = formula_attributes[:formula]
  formula.result = formula_attributes[:result]
  formula.description = formula_attributes[:description]
  formula.save!
  puts "Horadric Cube Formula #{formula.items.join(", ")} created"
end
