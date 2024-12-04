class FoodItem < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: :name,
    using: {
      tsearch: { prefix: true }
    }


  validates :name, presence: true, unless: :photo_attached?
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :unit, presence: true, inclusion: { in: ["g", "L", "pcs"], message: "%{value} is not a valid unit" }
  # validates :nutri_score, presence: true, inclusion: { in: ["A", "B", "C", "D", "E"], message: "%{value} is not a valid NutriScore" }
  # validates :shelf_life, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  before_save :calculate_expiry_date


  private

  def photo_attached?
    photo.attached?
  end

  def calculate_expiry_date
    if expiry_date.blank? && shelf_life.present?
      self.expiry_date = created_at || Date.current + expected_lifetime
    end
  end
end
