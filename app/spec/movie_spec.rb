require_relative '../models/movie'

describe Movie do
  context 'Given a provided movie' do
    # params: title, source, publish_date, archived, silent
    movie = Movie.new('1997-12-31', true)

    # initialize
    it 'Created the movie with the correct parameters' do
      expect(movie.publish_date).to eql('1997-12-31')
      expect(movie.silent).to eql(true)
    end

    # add_a_movie
    it "returns the movie's correct publish_date and silent status" do
      new_movie = Movie.new('2010-07-16', false)

      expect(new_movie.publish_date).to eql('2010-07-16')
      expect(new_movie.silent).to eql(false)
    end

    # list_all_movies
    it 'returns the correct list of all movies' do
      Movie.list_all_movies

      output = puts('"1 - Pusbished on: 1997-12-31"')
      expect do
        Movie.list_all_movies
      end.to output(output).to_stdout
    end

    # find a movie by index
    it 'finds the correct movie by index' do
      movie = Movie.new('2023-10-20', true)
      Movie.movies.push(movie)

      movie_index = Movie.find_movie_by_index(0)
      expect(movie_index.publish_date).to eql('2023-10-20')
    end
  end
end
