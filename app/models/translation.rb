class Translation < ApplicationRecord
  belongs_to :word

  validates :lang, presence: true
  validates :text, presence: true
end