require 'spec_helper'

RSpec.describe QuestionsController, :type => :controller do
  render_views
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "should assign @questions to Question.all" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end
    it "should display all the questions" do 
      question = Question.create(title: "Hey", content: "What's up.")
      get :index
      expect(response.body).to include(question.title)
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    let(:question) { Question.create(title: "Hey", content: "What's up.") }
    let(:answer) { Answer.create(title: "This is the answer", content: "Hope this helps.")}
    it "returns http success" do
      get :show, {id: question.id}
      expect(response).to have_http_status(:success)
    end
    it "should assign @question to the correct question" do
      get :show, {id: question.id}
      expect(assigns(:question)).to eq Question.find(question.id)
    end
    it "should display the question" do 
      get :show, {id: question.id}
      expect(response.body).to include(question.title)
    end
    it "should show the answers" do 
      question.answers << answer
      get :show, {id: question.id}
      expect(response.body).to include("This is the answer")
    end
  end
end
