require 'sepa_api'
class ProfessorsController < ApplicationController



  def nuevo
      @professor = Professor.new
  end


  def crear
    sepa = SepaApi.new()
    rut = params['professor']['rut']
    salida = Professor.find_by_rut(rut)
    if salida != nil
      @professor = salida
    else
      @professor = sepa.getDocente(rut)
    end
    respond_to do |format|
      if @professor.save
          format.html{redirect_to professor_path(@professor), notice: 'funciono la wea'}
      else
        format.html{render :nuevo}
      end
    end
  end
end
