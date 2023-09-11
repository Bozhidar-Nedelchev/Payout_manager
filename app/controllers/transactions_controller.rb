class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show]

  def show
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
