class AnswersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @answers = Answer.where(question_id: @question).find_each
    @answer = Answer.create(body: params["answer"]["body"], question: @question, user_id: "1".to_i)

    if @answer.save
      flash[:notice] = 'Answer submitted'
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:body, :question_id, :user_id)
    end
end
