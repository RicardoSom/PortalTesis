require 'sepa_api'
class StudentsController < ApplicationController


  def index

  end

  def nuevo
    @student = Student.new
  end

  def ingresar
    sepa = SepaApi.new()
    rut = params['student']['rut']
    @student = sepa.getEstudiante(rut)
    respond_to do |format|
      if @student.save
        format.html{redirect_to student_path(@student), notice: 'funciono la wea'}
      else
        format.html{render :nuevo}
      end
    end
  end

  def show
    @student = Student.find(params[:id])
  end
end
