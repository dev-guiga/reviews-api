module Api
  module V1
    class BookReviewsController < ApplicationController
      before_action :set_book_review, only: %i[ show update destroy ]

      # GET /book_reviews
      # GET /book_reviews.json
      def index
        @book_reviews = BookReview.all
      end

      # GET /book_reviews/1
      # GET /book_reviews/1.json
      def show
      end

      # POST /book_reviews
      # POST /book_reviews.json
      def create
        @book_review = BookReview.new(book_review_params)

        if @book_review.save
          render :show, status: :created, location: @book_review
        else
          render json: @book_review.errors, status: :unprocessable_content
        end
      end

      # PATCH/PUT /book_reviews/1
      # PATCH/PUT /book_reviews/1.json
      def update
        if @book_review.update(book_review_params)
          render :show, status: :ok, location: @book_review
        else
          render json: @book_review.errors, status: :unprocessable_content
        end
      end

      # DELETE /book_reviews/1
      # DELETE /book_reviews/1.json
      def destroy
        @book_review.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_book_review
          @book_review = BookReview.find(params.expect(:id))
        end

        # Only allow a list of trusted parameters through.
        def book_review_params
          params.fetch(:book_review, {})
        end
    end
  end
end
