class Rune < Attachable

  module CODES
    EL    = "el"
    ELD   = "eld"
    TIR   = "tir"
    NEF   = "nef"
    ETH   = "eth"
    ITH   = "ith"
    TAL   = "tal"
    RAL   = "ral"
    ORT   = "ort"
    THUL  = "thul"
    AMN   = "amn"
    SOL   = "sol"
    SHAEL = "shael"
    DOL   = "dol"
    HEL   = "hel"
    IO    = "io"
    LUM   = "lum"
    KO    = "ko"
    FAL   = "fal"
    LEM   = "lem"
    PUL   = "pul"
    UM    = "um"
    MAL   = "mal"
    IST   = "ist"
    GUL   = "gul"
    VEX   = "vex"
    OHM   = "ohm"
    LO    = "lo"
    SUR   = "sur"
    BER   = "ber"
    JAH   = "jah"
    CHAM  = "cham"
    ZOD   = "zod"
    ALL   = [EL, ELD, TIR, NEF, ETH, ITH, TAL, RAL, ORT, THUL, AMN, SOL, SHAEL, DOL, HEL, IO, LUM, KO, FAL, LEM, PUL, UM, MAL, IST, GUL, VEX, OHM, LO, SUR, BER, JAH, CHAM, ZOD]
  end


  field :position, type: Integer
  field :upgrade_item_codes, type: Array

  def items_to_upgrade
    @runes || set_items_to_upgrade(runes_for_upgrade)
  end

  def self.to_select
    all
      .only(:name, :image, :image_filename, :_type, :code)
      .order_by(position: :asc)
      .to_a
  end

  def set_items_to_upgrade(rune_list)
    @runes = rune_list
  end

  private 

    def runes_for_upgrade
      items = Attachable.where(:code.in => upgrade_item_codes, :_type.in => Attachable.valid_types ).to_a
      upgrade_item_codes.map { |code| items.find { |item| item.code == code } }      
    end

end