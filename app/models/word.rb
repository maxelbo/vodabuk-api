class Word < ApplicationRecord
  has_many :translations, dependent: :destroy
  has_many :examples, dependent: :destroy

  accepts_nested_attributes_for :translations, allow_destroy: true
  accepts_nested_attributes_for :examples, allow_destroy: true

  validates :lang, presence: true
  validates :word, presence: true, uniqueness: { scope: :lang }
  validates :category, presence: true

  before_save :set_letter

  serialize :roots, JSON

  def as_json(options = {})
    json = super(options.merge(only: [:word, :roots, :lang, :letter, :category], include: {
      translations: { only: [:lang, :text] },
      examples: { only: [:lang, :text] },
    }))
    
    # As empty arrays, instead of Null
    json['roots'] ||= []
    json['examples'] ||= []

    json
  end

  private

  def set_letter
    self.letter = word[0].downcase if word.present?
  end
end
