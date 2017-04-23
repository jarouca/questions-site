class AnswersController < ApplicationController
  def index
  end

  def new
  end
# - is this the best way to accomplish this:
# - we call the below answers#create from a form on the questions show view
# - in the conditional below, the else branch wants to rerender the questions show view, but I don't know if that is possible, to render a view from a different controller
# - so I copy/pasted the questions show view into the answers new view and that is what is being rendered below in the else branch of the conditional

  def create
    @question = Question.find(params[:question_id])
    @answers = Answer.where(question_id: @question).find_each
    @answer = Answer.create(body: params["answer"]["body"], question: @question, user_id: "1".to_i)
    # @answer = Answer.new(answer_params)

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
