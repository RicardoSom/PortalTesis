require 'sepa_api'
class ProfessorsController < ApplicationController

  def index
    termino = params[:termino]
    if termino == nil
      @professors = Professor.all
    else
      @professors = Professor.search(termino)
    end
  end

  def nuevo
      @professor = Professor.new
  end


  def crear
    sepa = SepaApi.new()
    rut = params['professor']['rut']
    @professor = sepa.getDocente(rut)
    if @professor != nil
        if Professor.find_by_rut(@professor.rut) == nil
          respond_to do |format|
            if @professor.save
              format.html{redirect_to professor_path(@professor), notice: 'Guardado exitosamente en base de datos'}
            else
              format.html{render :nuevo}
            end
          end
        else
          respond_to do |format|
            @professor = Professor.find_by_rut(@professor.rut)
            format.html{redirect_to professor_path(@professor), notice: 'Ya existe dicho docente'}
          end
        end
    else
        respond_to do |format|
          format.html{redirect_to new_professor_path(@professor), notice: 'Docente no encontrado en dirdoc'}
        end
    end
  end

  def show
    @professor = Professor.find(params[:id])

  end

  def destroy
    @professor = Professor.find(params[:id])
    if @professor.destroy
      redirect_to root_path
    else
      "Error al eliminar la carrera"
    end
  end

end
