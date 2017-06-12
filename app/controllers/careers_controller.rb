class CareersController < ApplicationController
  def index
    @careers = Career.all
  end

  def new
    @career = Career.new
  end

  def create
    @career = Career.new(career_params)
    if @career.save
        redirect_to root_path
    else
        "Error al crear la carrera"
    end
  end

  def edit
    @career = Career.find(params[:id])
  end

  def update
    @career = Career.find(params[:id])
    if @career.update(career_params)
      redirect_to root_path
    else
      "Error al actualizar"
    end
  end

  def show
    @career = Career.find(params[:id])
  end

  def destroy
    @career = Career.find(params[:id])
    if @career.destroy
      redirect_to root_path
    else
      "Error al eliminar la carrera"
    end
  end

  private
  def career_params
    params.require(:career).permit(:namecareer)
  end
end
