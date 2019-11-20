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
    @figure = Figure.create(:name => params[:figure][:name])

    title_selections = params[:figure][:titles]
    if title_selections != nil
      title_selections.each do |title|
      @figure.titles << Title.find(title)
      end
    end
    new_title = params[:figure][:title]
    if new_title != nil
      @figure.title = new_title
    end

    landmark_selections = params[:figure][:landmarks]
    if landmark_selections != nil
      landmark_selections.each do |landmark|
      @figure.landmarks << Landmark.find(landmark)
      end
    end
    new_landmark = params[:figure][:landmark]
    if new_landmark != nil
      @figure.landmark = new_landmark
    end

    @song.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end
end
