class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @questions = Question.all
    render json: @questions
  end

  def show
    render json: @question
  end

  def create
    @question = Question.create(question_params)
    render json: @question
  end

  def update
    @question.update(question_params)
    render json: @question
  end

  def destroy
    @question.destroy
    render json: { message: "destroyed" }
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content)
    end
end