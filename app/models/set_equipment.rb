class SetEquipment
  include Mongoid::Document

  field :name, type: String
  field :partial_bonus, type: Array
  field :full_bonus, type: Array
  field :character, type: String

end