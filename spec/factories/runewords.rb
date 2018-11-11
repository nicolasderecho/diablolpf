FactoryBot.define do
  factory :runeword do
    code { |runeword| "Runeword code #{runeword.id}"}
    name 'a runeword'
    specs ['Some specs']
    rune_codes []
    applicable_in []
    holes { rand(1..6) }
  end
end