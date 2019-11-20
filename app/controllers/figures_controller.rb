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

    title_entry = params[:figure][:title]
    if Title.find_by(:name => title_entry)
      title = Title.find_by(:name => title_entry)
    else
      title = Title.create(:name => title_entry)
    end
    @figure.title = title

    genre_selections = params[:song][:genres]
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
