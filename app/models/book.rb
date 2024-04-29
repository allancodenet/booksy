class Book < ApplicationRecord
  include PgSearch
  multisearchable against: [:title, :subtitle, :description]
  belongs_to :publisher
  belongs_to :author

  validates :title, presence: true
  validates :released_on, presence: true
  validates :author, presence: true

  validates :isbn_10, presence: true, length: {is: 10}, uniqueness: true
  validates :isbn_13, presence: true, length: {is: 13}, uniqueness: true
  has_one_attached :cover
  mount_base64_uploader :cover, CoverUploader
end
