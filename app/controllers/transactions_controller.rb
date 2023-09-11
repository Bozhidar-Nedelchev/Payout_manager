class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:show]

  def show
  end
  
  def index
    @transactions = Transaction.all # Assuming you have a Transaction model
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
