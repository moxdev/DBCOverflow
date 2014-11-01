class QuestionsController < ApplicationController

respond_to :js
  def index
    @questions = Question.all.order('vote_count desc')
    @response = HTTParty.get('https://api.github.com/zen', { basic_auth: {username: ENV["USERNAME"], password: ENV["PASSWORD"]}, headers: {"User-Agent" => 'http://developer.github.com/v3'}})
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question was saved'
      respond_to do |format|
        format.html { render :action => :new}
        format.js
      end
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to questions_path
  end

  def new
    @question = Question.new
    respond_to do |format|
      format.html {render :action => :new}
      format.js
    end
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
