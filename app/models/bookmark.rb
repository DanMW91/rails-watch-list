class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates_uniqueness_of :movie_id, scope: [:list_id]
  validates :movie_id, presence: true
  validates :list_id, presence: true
  validates :comment, length: { minimum: 2 }
end
