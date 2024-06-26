class Api::V1::TransactionsController < ApplicationController
  def create
    user = User.find_by(id: transaction_params[:user_id])
    if user.nil?
      render json: { status: 'error', message: 'User not found' }, status: :not_found
      return
    end

    transaction = user.transactions.new(transaction_params)

    if transaction.save
      render json: { status: 'success', transaction_id: transaction.transaction_id }, status: :created
    else
      render json: { status: 'error', message: transaction.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_id, :points, :user_id, :status)
  end
end
