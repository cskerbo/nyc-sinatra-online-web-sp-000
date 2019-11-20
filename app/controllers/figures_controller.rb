class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figure/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end
end
