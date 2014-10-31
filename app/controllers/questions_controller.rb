class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order('vote_count desc')
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
    @question = Question.includes(:answers).find(params[:id])

    # @question.includes(:answers)
    # @answers = @question.answers
    @answer = Answer.new
  end

  def upvote
    @question = Question.find(params[:id])
    @question.vote_count += 1
    @question.save
    redirect_to questions_path
  end

  def downvote
    @question = Question.find(params[:id])
    @question.vote_count -= 1
    @question.save
    redirect_to questions_path
  end


  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
