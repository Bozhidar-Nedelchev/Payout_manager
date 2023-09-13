class Api::CardsController < ApplicationController
before_action :set_card, only: [:show, :update, :destroy]

  # GET /api/cards
  def index
    @cards = Card.all # You may need to customize this based on your business logic
    render json: @cards
  end

  # GET /api/cards/:id
  def show
    render json: @card
  end

  # POST /api/cards
  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/cards/:id
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/cards/:id
  def destroy
    @card.destroy
    head :no_content
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:product_id, :reference_number, :activation_number, :transaction, :amount, :status)
  end
end