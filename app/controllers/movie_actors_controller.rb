class MovieActorsController < ApplicationController
  def create
    @movie = Movie.find(params[:id])
    @actor = Actor.create!(actor_params)
    @movie_actor = @movie.actors.create(params[:movie_id => @movie.id, :actor_id => @actor.id])
    # @movie_actor = MovieActor.create!(movie_actor_params)
  end

  private

    # def movie_actor_params
    #   params.permit(:movie_id, :actor_id)
    # end

    def actor_params
      params.permit(:name, :age)
    end
end