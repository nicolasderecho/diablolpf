require "csv"
class DataLoader

  def self.read_runes_data
    CSV.open(Rails.root.join("db", "data", "runes.csv"), headers: true).map do |row|
      {}.with_indifferent_access.
      merge(row.to_hash).
      merge({
        weapons: row["weapons"].split(",").map(&:squish),
        armors: row["armors"].split(",").map(&:squish),
        helms: row["helms"].split(",").map(&:squish),
        shields: row["shields"].split(",").map(&:squish),
        upgrade_item_codes: (row["upgrade_item_codes"] || "").split(",").map(&:squish)
      })
    end
  end

  def self.read_gems_data
    CSV.open(Rails.root.join("db", "data", "gems.csv"), headers: true).map do |row|
      {}.with_indifferent_access.
      merge(row.to_hash).
      merge({
        weapons: row["weapons"].split(",").map(&:squish),
        armors: row["armors"].split(",").map(&:squish),
        helms: row["helms"].split(",").map(&:squish),
        shields: row["shields"].split(",").map(&:squish)
      })      
    end
  end

  def self.read_runewords_data
    CSV.open(Rails.root.join("db", "data", "runewords.csv"), headers: true).map do |row|
      {}.with_indifferent_access.
      merge(row.to_hash).
      merge({
        specs: row["specs"].split(",").map {|el| el.squish.gsub("??","ñ").gsub("?","ñ") },
        code: I18n.transliterate(row["code"].squish.underscore.gsub("??","ñ").gsub("?","ñ")),
        name: row["name"].squish.gsub("??","ñ").gsub("?","ñ").capitalize,
        rune_codes: row["rune_codes"].split(",").map {|code| code.squish.gsub("??","ñ").gsub("?","ñ").downcase },
        applicable_in: row["applicable_in"].split(",").map {|el| el.squish.gsub("??","ñ").gsub("?","ñ")}
      })      
    end
  end


  def self.read_formulas_data
    CSV.open(Rails.root.join("db", "data", "cubo.csv"), headers: true).map do |row|
      {}.with_indifferent_access.
      merge(row.to_hash).
      merge({
        formula: row["formula"].split(",").map {|el| el.squish.gsub("??","ñ") },
        result: row["result"].to_s.squish.gsub("??","ñ"),
        description: row["description"].to_s.squish.gsub("??","ñ")
      })      
    end    
  end


  def self.all
    {
      runes: read_runes_data,
      gems: read_gems_data,
      runewords: read_runewords_data,
      formulas: read_formulas_data
    }.with_indifferent_access
  end

end