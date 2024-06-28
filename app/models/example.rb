class Example < ApplicationRecord
  belongs_to :word

  validates :lang, presence: true
  validates :text, presence: true
end