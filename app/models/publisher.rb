class Publisher < ApplicationRecord
  include PgSearch
  multisearchable against: [:name]
  validates :name, presence: true

  has_many :books
end
