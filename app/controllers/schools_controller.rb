class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to root_path
    else
      "Error al crear usuario"
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      redirect_to root_path
    else
      "Error al actualizar"
    end
  end

  def show
    @school = School.find(params[:id])
  end

  def destroy
    @school = School.find(params[:id])
    if @school.destroy
      redirect_to root_path
    else
      "Error al eliminar la carrera"
    end
  end

  private
  def school_params
    params.require(:school).permit(:nameschool)
  end
end
