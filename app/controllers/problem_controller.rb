require './config/environment'

class ProblemController < ApplicationController

  get "/problems" do
    @problems = Problem.all

    erb :"problems/index"
  end

  get "/problems/new" do

    erb :"problems/new"
  end

  post "/problems" do
    problem = Problem.new(params)

    if problem.save
      redirect "problems/#{problem.id}"
    else
      redirect "problems/new"
    end
  end

  get "/problems/:id" do
    @problem = Problem.find_by_id(params[:id])

    if @problem
      erb :"problems/show"
    else
      redirect "/problems"
    end
  end

  get "/problems/:id/edit" do
    @problem = Problem.find_by_id(params[:id])

    erb :"problems/edit"
  end

  patch "/problems/:id" do
    problem = Problem.find_by_id(params[:id])
    problem.title = params[:title]
    problem.description = params[:description]
    problem.deadline = params[:deadline]
    
    if problem.completed
      problem.completed = "Done"
    else
      problem.completed = "Not Done"
    end

    if problem.save
      erb :"/problems/show"
    else
      redirect "/problems/#{problem.id}/edit"
    end
  end

end
