
class Restaurant < ApplicationRecord

  validates :name, length: {minimum: 3}, uniqueness: true

  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  def average_rating
    return "N/A" if reviews.none?
    reviews.average(:rating)
  end



  belongs_to :user
end
