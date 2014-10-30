class QuestionsController < ApplicationController
  def index
    @questions = Question.order(:votes).reverse
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question was saved'
      redirect_to questions_path
    else
      render :action => :new
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to questions_path
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(:votes).reverse
  end

  def up_vote
    @question = Question.find(params[:id])
    @question.votes += 1
    @question.save
    redirect_to questions_path
  end

  def down_vote
    @question = Question.find(params[:id])
    @question.votes -= 1
    @question.save
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
