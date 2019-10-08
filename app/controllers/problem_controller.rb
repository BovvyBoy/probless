require './config/environment'

class ProblemController < ApplicationController

  get "/problems" do
    @problems = Problem.all

    erb :"problems/index"
  end

  get "/problems/:id" do
    @problem = Problem.find_by_id(params[:id])

    if @problem
      erb :"problems/show"
    else
      redirect "/problems"
    end
  end

end
