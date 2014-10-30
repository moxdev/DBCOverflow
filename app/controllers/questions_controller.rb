class QuestionsController < ApplicationController
  # before_action :all_tasks, only: [:index, :create]
  respond_to :html, :js

  def index
    client = Octokit::Client.new(:login => ENV['USERNAME'], :password => ENV['PASSWORD'])
    @user = client.login
    @response = client.get('https://api.github.com/zen')
    @questions = Question.order(:votes).reverse
    @question = Question.new

    respond_to do |format|
      format.html
      format.js
    end

  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question was saved'
    else
      flash[:notice] = 'Question was not saved'
    end
    @questions = Question.order(:votes).reverse
      respond_to do |format|
        format.html
        format.js
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
      format.html
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
    @answers = @question.answers.order(:votes).reverse
  end

  def up_vote
    @question = Question.find(params[:id])
    @question.votes += 1
    @question.save
    @questions = Question.order(:votes).reverse
    respond_to do |format|
      format.html
      format.js {render 'vote'}
    end
  end

  def down_vote
    @question = Question.find(params[:id])
    @question.votes -= 1
    @question.save
    @questions = Question.order(:votes).reverse
    respond_to do |format|
      format.html
      format.js {render 'vote'}
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end
end
