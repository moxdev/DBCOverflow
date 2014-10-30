class AnswersController < ApplicationController
  def index
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    if @answer.save
      flash[:notice] = 'Answer was created'
      redirect_to question_path(params[:question_id])
    else
      redirect_to question_path
    end

  end

  def update
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def destroy
  end

  def show
    @answer = "what"
  end

  def up_vote
    @answer = Answer.find(params[:id])
    @answer.votes += 1
    @answer.save
    redirect_to :back
  end

  def down_vote
    @answer = Answer.find(params[:id])
    @answer.votes -= 1
    @answer.save
    redirect_to :back
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
