class QuestionsController < ApplicationController
  def index
    @questions = Question.all.reverse_order
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(title: params["question"]["title"], description: params["question"]["description"], user_id: "1".to_i)
    # @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question posted successfully'
      redirect_to @question
    else
      render action: 'new'
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :description, :user_id)
    end
end
