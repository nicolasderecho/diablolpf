FactoryGirl.define do
  factory :rune do
    weapons ['some weapon attributes']
    shields ['some shield attributes']
    armors ['some armor attributes']
    helms  ['some helms attributes']
    code { Rune::CODES::ALL.sample }
    name { |rune| rune.code }
    position { |rune| Rune::CODES::ALL.index(rune.code).to_i + 1 }
    level { rand(1..60) }
    upgrade_item_codes { [] }
  end

  Rune::CODES::ALL.each do |rune_code|

    trait rune_code.to_sym do
      code { rune_code }
    end

  end

end