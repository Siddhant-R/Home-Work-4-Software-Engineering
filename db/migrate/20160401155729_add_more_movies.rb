class AddMoreMovies < ActiveRecord::Migration
  MORE_MOVIES = [
    {:title => 'Chauranga', :rating => 'G', :release_date => '08-Jan-2016'},
    {:title => 'Wazir', :rating => 'R', :release_date => '08-Jan-2016'},
    {:title => 'Chalk n Duster', :rating => 'R', :release_date => '15-Jul-2015'},
    {:title => 'Rebellious Flower', :rating => 'PG-13', :release_date => '15-Aug-2011'},
    {:title => 'Airlift', :rating => 'PG-13', :release_date => '22-Jan-2016'},
    {:title => 'Jugni', :rating => 'R', :release_date => '22-Apr-2001'},
    {:title => 'Mastizaade', :rating => 'G', :release_date => '29-Apr-2010'},
    {:title => 'Fitoor', :rating => 'PG', :release_date => '23-Dec-2009'},
    {:title => 'Sanam Re', :rating => 'G', :release_date => '12-Feb-2015'},
  ]
  def up
    Movie.delete_all
    MORE_MOVIES.each do |movie|
      Movie.create!(movie)
    end
  end

  def down
    MORE_MOVIES.each do |movie|
      Movie.find_by_title_and_rating(movie[:title], movie[:rating]).destroy
    end
  end
end