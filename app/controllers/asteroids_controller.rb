class AsteroidsController < ApplicationController
  def index
    @asteroids = Asteroid.includes(:close_approaches).all
  end
end
