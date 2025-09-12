class AsteroidsController < ApplicationController
  # Muestra todos los asteroides
  def index
    @asteroids = Asteroid.all
  end

  # Muestra un asteroide específico
  def show
    @asteroid = Asteroid.find(params[:id])
  end

  # Formulario para nuevo asteroide
  def new
    @asteroid = Asteroid.new
  end

  # Crea un asteroide
  def create
    @asteroid = Asteroid.new(asteroid_params)
    if @asteroid.save
      redirect_to asteroids_path, notice: "Asteroide creado con éxito 🚀"
    else
      render :new
    end
  end

  # Formulario para editar un asteroide
  def edit
    @asteroid = Asteroid.find(params[:id])
  end

  # Actualiza un asteroide
  def update
    @asteroid = Asteroid.find(params[:id])
    if @asteroid.update(asteroid_params)
      redirect_to asteroids_path, notice: "Asteroide actualizado ✅"
    else
      render :edit
    end
  end

  # Elimina un asteroide
  def destroy
    @asteroid = Asteroid.find(params[:id])
    @asteroid.destroy
    redirect_to asteroids_path, alert: "Asteroide eliminado ❌"
  end

  private

  def asteroid_params
    params.require(:asteroid).permit(:name, :diameter, :velocity, :impact_probability)
  end
end
