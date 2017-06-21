require 'sepa_api'
class StudentsController < ApplicationController


  def index

  end

  def nuevo
    @student = Student.new
  end

  def crear
    sepa = SepaApi.new()
    rut = params['student']['rut']
    salida = Student.find_by_rut(rut)
    if salida != nil
      @student = salida
    else
      @student = sepa.getEstudiante(rut)
    end
    respond_to do |format|
      if @student.save
          format.html{redirect_to student_path(@student), notice: 'Creado estudiante con exito'}
      else
        format.html{render :nuevo}
      end
    end
  end

  def show
    @student = Student.find(params[:id])
  end
end
