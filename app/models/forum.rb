class Forum < ApplicationRecord
  validates :movie_id, uniqueness: true
end
