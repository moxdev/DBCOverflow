class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def create
  end

  def update
  end

  def new
  end

  def edit
  end

  def destroy
  end

  def show
    @question = Question.find(params[:id])
  end

end
