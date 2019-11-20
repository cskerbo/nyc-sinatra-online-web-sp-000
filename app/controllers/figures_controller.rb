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

    landmark_selections = params[:song][:genres]
    if genre_selections != nil
      genre_selections.each do |genre|
      @song.genres << Genre.find(genre)
      end
    end

    @song.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end
end
