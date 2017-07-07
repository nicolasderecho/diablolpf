class Item
  include Mongoid::Document

  field :name, type: String
  field :code, type: String
  field :character, type: String
  field :item_class, type: String
  field :item_type, type: String
  field :level, type: Integer

  index({ code: 1 }, { unique: true, name: "code_index" })
  index({ item_type: 1 }, { name: "item_type_index" })

end