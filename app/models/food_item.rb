class FoodItem < ApplicationRecord
  belongs_to :user
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: :name,
    using: {
      tsearch: { prefix: true }
    }


  validates :name, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  # validates :unit, presence: true, inclusion: { in: ["g", "l", "pcs"], message: "%{value} is not a valid unit" }
  # validates :nutriscore, presence: true, inclusion: { in: ["A", "B", "C", "D", "E"], message: "%{value} is not a valid NutriScore" }
  # validates :shelf_life, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  before_save :calculate_expiry_date


  private

  def calculate_expiry_date
    if expiry_date.blank? && shelf_life.present?
      self.expiry_date = created_at || Time.current + shelf_life.days
    end
  end
end
