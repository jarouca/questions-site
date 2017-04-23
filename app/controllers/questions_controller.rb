class QuestionsController < ApplicationController
  def index
    @questions = Question.all.reverse_order
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.where(question_id: @question).find_each
  end

  def new
    @question = Question.new
    @page_title = "New Question"
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

  def edit
    @question = Question.find(params["id"])
    @page_title = "Edit Question"
    render 'new'
  end

  def update
  end

  private
    def question_params
      params.require(:question).permit(:title, :description, :user_id)
    end
end
