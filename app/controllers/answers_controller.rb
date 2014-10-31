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

  def upvote
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @answer.vote_count += 1
    @answer.save
    redirect_to @question
  end

  def downvote
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @answer.vote_count -= 1
    @answer.save
    redirect_to @question
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
