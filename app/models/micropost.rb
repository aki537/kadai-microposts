class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :favoriteusers, through: :favorites, source: :user
  
  def unlikepostusers
    favorites = self.favoriteusers
    favorites.destroy_all if favorites
  end

  def likepostusers?
    self.favoriteusers.present?
  end
end