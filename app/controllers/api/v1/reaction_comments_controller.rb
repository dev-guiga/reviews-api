module Api
  module V1
    class ReactionCommentsController < ApplicationController
    before_action :set_reaction_comment, only: %i[ show update destroy ]

    # GET /reaction_comments
    # GET /reaction_comments.json
    def index
      @reaction_comments = ReactionComment.all
    end

    # GET /reaction_comments/1
    # GET /reaction_comments/1.json
    def show
    end

    # POST /reaction_comments
    # POST /reaction_comments.json
    def create
      @reaction_comment = ReactionComment.new(reaction_comment_params)

      if @reaction_comment.save
        render :show, status: :created, location: @reaction_comment
      else
        render json: @reaction_comment.errors, status: :unprocessable_content
      end
    end

    # PATCH/PUT /reaction_comments/1
    # PATCH/PUT /reaction_comments/1.json
    def update
      if @reaction_comment.update(reaction_comment_params)
        render :show, status: :ok, location: @reaction_comment
      else
        render json: @reaction_comment.errors, status: :unprocessable_content
      end
    end

    # DELETE /reaction_comments/1
    # DELETE /reaction_comments/1.json
    def destroy
      @reaction_comment.destroy!
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_reaction_comment
        @reaction_comment = ReactionComment.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def reaction_comment_params
        params.fetch(:reaction_comment, {})
      end
    end
  end
end
