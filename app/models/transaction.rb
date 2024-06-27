class Transaction < ApplicationRecord
  belongs_to :user

  validates :transaction_id, presence: { message: "Transaction ID can't be blank" }, uniqueness: { message: "Transaction ID has already been taken" }
  validates :points, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
end
