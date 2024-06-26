class Transaction < ApplicationRecord
  belongs_to :user

  validates :transaction_id, presence: true, uniqueness: true
  validates :points, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
end
