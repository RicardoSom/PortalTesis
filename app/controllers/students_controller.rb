require 'sepa_api'
class StudentsController < ApplicationController


  def index
    @students = Student.all
  end

  def nuevo
    @student = Student.new
  end

  def crear
    sepa = SepaApi.new()
    rut = params['student']['rut']
    @student = sepa.getEstudiante(rut)
    if @student != nil
        if Student.find_by_rut(@student.rut) == nil
          respond_to do |format|
            if @student.save
              format.html{redirect_to student_path(@student), notice: 'Guardado exitosamente en base de datos'}
            else
              format.html{render :nuevo}
            end
          end
        else
          respond_to do |format|
            @student = Student.find_by_rut(@student.rut)
            format.html{redirect_to student_path(@student), notice: 'Ya existe dicho estudiante'}
          end
        end
    else
        respond_to do |format|
          format.html{redirect_to new_student_path(@student), notice: 'Estudiante no encontrado en dirdoc'}
        end
    end
end

  def show
    @student = Student.find(params[:id])
  end
end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      redirect_to root_path
    else
      "Error al eliminar la carrera"
    end
  end
