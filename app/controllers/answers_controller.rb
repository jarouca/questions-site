class AnswersController < ApplicationController
  def edit
    if Answer.find_by best_answer: true
      old_answer = Answer.find_by best_answer: true
      old_answer.toggle!(:best_answer)
    end

    new_answer = Answer.find(params["id"])
    new_answer.toggle!(:best_answer)

    @answers = Answer.order("best_answer DESC")
    @question = Question.find(params[:question_id])
    @answer = Answer.new

    render 'questions/show'
  end


  def create
    @question = Question.find(params[:question_id])
    @answers = Answer.where(question_id: @question).find_each
    @answer = Answer.create(body: params["answer"]["body"], markdown: params["answer"]["markdown"], question: @question, user_id: "1".to_i)

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
