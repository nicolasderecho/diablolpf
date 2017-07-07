FactoryGirl.define do
  factory :game_gem do
    gem_type { GameGem::TYPES::ALL.sample }
    code { |game_gem| "#{game_gem.gem_type}-#{GameGem::PARTS::ALL.sample}" }
    weapons ['some weapon attributes']
    shields ['some shield attributes']
    armors ['some armor attributes']
    helms  ['some helms attributes']

    trait :amethyst do
      gem_type { GameGem::TYPES::AMETHYST }
    end

    trait :topaz do
      gem_type { GameGem::TYPES::TOPAZ }
    end

    trait :diamond do
      gem_type { GameGem::TYPES::DIAMOND }
    end

    trait :emerald do
      gem_type { GameGem::TYPES::EMERALD }
    end

    trait :ruby do
      gem_type { GameGem::TYPES::RUBY }
    end

    trait :sapphire do
      gem_type { GameGem::TYPES::SAPPHIRE }
    end

    trait :skull do
      gem_type { GameGem::TYPES::SKULL }
    end

    trait :chipped do
      code { |game_gem| "#{game_gem.gem_type}-#{GameGem::PARTS::CHIPPED}" }
    end

    trait :flawed do
      code { |game_gem| "#{game_gem.gem_type}-#{GameGem::PARTS::FLAWED}" }
    end

    trait :normal do
      code { |game_gem| "#{game_gem.gem_type}-#{GameGem::PARTS::NORMAL}" }
    end

    trait :flawless do
      code { |game_gem| "#{game_gem.gem_type}-#{GameGem::PARTS::FLAWLESS}" }
    end

    trait :perfect do
      code { |game_gem| "#{game_gem.gem_type}-#{GameGem::PARTS::PERFECT}" }
    end

  end
end
