module Api
  module V1
    class InteractionReviewsController < ApplicationController
  before_action :set_interaction_review, only: %i[ show update destroy ]

  # GET /interaction_reviews
  # GET /interaction_reviews.json
  def index
    @interaction_reviews = InteractionReview.all
  end

  # GET /interaction_reviews/1
  # GET /interaction_reviews/1.json
  def show
  end

  # POST /interaction_reviews
  # POST /interaction_reviews.json
  def create
    @interaction_review = InteractionReview.new(interaction_review_params)

    if @interaction_review.save
      render :show, status: :created, location: @interaction_review
    else
      render json: @interaction_review.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /interaction_reviews/1
  # PATCH/PUT /interaction_reviews/1.json
  def update
    if @interaction_review.update(interaction_review_params)
      render :show, status: :ok, location: @interaction_review
    else
      render json: @interaction_review.errors, status: :unprocessable_content
    end
  end

  # DELETE /interaction_reviews/1
  # DELETE /interaction_reviews/1.json
  def destroy
    @interaction_review.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interaction_review
      @interaction_review = InteractionReview.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def interaction_review_params
      params.fetch(:interaction_review, {})
    end
    end
  end
end
