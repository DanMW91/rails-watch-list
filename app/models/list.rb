class List < ApplicationRecord
  has_one_attached :photo
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :photo, presence: true
  validates :name, uniqueness: true
  validates :name, presence: true
end
