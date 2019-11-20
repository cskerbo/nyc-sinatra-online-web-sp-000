class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])

    if params[:title][:name].present?
      @figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name].present?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'figures/show'
  end
end
