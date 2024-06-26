# require 'rails_helper'

# RSpec.describe Transaction, type: :model do
#   let(:user) { FactoryBot.create(:user) }
#   let(:transaction) { FactoryBot.build(:transaction, user: user) }

#   describe "validations" do
#     it "is valid with valid attributes" do
#       expect(transaction).to be_valid
#     end

#     it "is not valid without a transaction_id" do
#       transaction.transaction_id = nil
#       expect(transaction).to_not be_valid
#     end

#     # it "is not valid with a duplicate transaction_id" do
#     #   duplicate_transaction = FactoryBot.create(:transaction, transaction_id: transaction.transaction_id)
#     #   expect(duplicate_transaction).to_not be_valid
#     # end

#     it "is not valid without points" do
#       transaction.points = nil
#       expect(transaction).to_not be_valid
#     end

#     it "is not valid with non-integer points" do
#       transaction.points = "ten"
#       expect(transaction).to_not be_valid
#     end

#     it "is not valid without a status" do
#       transaction.status = nil
#       expect(transaction).to_not be_valid
#     end
#   end

#   describe "associations" do
#     it "belongs to a user" do
#       assoc = described_class.reflect_on_association(:user)
#       expect(assoc.macro).to eq :belongs_to
#     end
#   end
# end
