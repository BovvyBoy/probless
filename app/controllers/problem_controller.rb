require './config/environment'

class ProblemController < ApplicationController

#index
  get "/problems" do
    if logged_in?
      @user = current_user
      @problems = @user.problems
      erb :"problems/index"
    else
      redirect "/signup"
    end
  end

#show all
  get "problems/all" do
    if logged_in?
      @problems = Problem.all

      erb :"problems/index"
    else
      redirect "/login"
    end
  end

#new
  get "/problems/new" do

    erb :"problems/new"
  end

#create
  post "/problems" do
    user = User.find_by_id(session[:user_id])
    @problem = user.problems.build(params)

    if @problem.save
      redirect "problems/#{@problem.id}"
    else
      redirect "problems/new"
    end
  end

#show
  get "/problems/:id" do
    @problem = Problem.find_by_id(params[:id])

    if @problem
      erb :"problems/show"
    else
      redirect "/problems"
    end
  end

#edit
  get "/problems/:id/edit" do
    @problem = Problem.find_by_id(params[:id])

    erb :"problems/edit"
  end

  patch "/problems/:id" do
    @problem = Problem.find_by_id(params[:id])

    if @problem.update(title: params[:title], description: params[:description], deadline: params[:deadline])
      redirect "problems/#{@problem.id}"
    else
      redirect "problems/#{@problem.id}/edit"
    end

    # if problem.completed
    #   problem.completed = "Done"
    # else
    #   problem.completed = "Not Done"
    # end

    # if problem.update
    #   redirect "/problems/show"
    # else
    #   redirect "/problems/#{problem.id}/edit"
    # end
  end

#delete
  delete "/problems/:id" do
    problem_creator = Problem.find_by_id(params[:id]).user
    #binding.pry
    if problem_creator.id == current_user.id
      Problem.destroy(params[:id])
      redirect "/problems"
    else
      #flash[:err] = "You Cant do That!!!"
      redirect "/problems"
    end

  end


end
