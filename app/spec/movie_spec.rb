require_relative '../models/movie'

describe Movie do
  context 'Given a provided movie' do
    # params: title, source, publish_date, archived, silent
    movie = Movie.new('Titanic', 'Youtube', '1997-12-31', true, true)

    # initialize
    it "Created the movie with the correct parameters" do
      expect(movie.title).to eql('Titanic')
      expect(movie.source).to eql('Youtube')
      expect(movie.publish_date).to eql('1997-12-31')
      expect(movie.archived).to eql(true)
      expect(movie.silent).to eql(true)
    end

    # add_a_movie
    it "returns the movie's correct title and source" do
      movie_data = {
        title: 'Inception',
        genre: 'Action',
        author: 'Christopher Nolan',
        source: 'Youtube',
        label: 'Warner Bros',
        publish_date: '2010-07-16',
        archived: false,
        silent: false
      }
      Movie.add_a_movie(movie_data)
      new_movie = Movie.list_all_movies.first

      expect(new_movie.title).to eql('Inception')
      expect(new_movie.source).to eql('Youtube')
    end

    # list_all_movies
    it "returns the correct list of all movies" do
      movies = Movie.list_all_movies

      expect(movies).to be_an(Array)
      expect(movies.first).to be_a(Movie)
      expect(movies.map(&:title)).to include('Titanic', 'Inception')
    end

    # find a movie by index
    it "returns the correct movie based on the provided index" do
      movie_index = Movie.find_movie_by_index(0)
      expect(movie_index.title).to eql('Titanic')
    end

    # can_be_archived?
    it "defines if the movie can be archived or not" do
      movie_to_archive = Movie.find_movie_by_index(0)
      expect(movie_to_archive.can_be_archived?).to eql(true)
    end
  end
end