require 'sepa_api'
class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    rut_student = params['document']['rut_student']+'-'+params['document']['student_v']
    student = Student.find_by_rut(rut_student)
    rut_professor = params['document']['rut_professor']+'-'+params['document']['professor_v']
    professor = Professor.find_by_rut(rut_professor)
    sepa = SepaApi.new
    if student!=nil
      student = student
    else
      student = sepa.getEstudiante(rut_student)
      student.save
    end

    if professor!=nil
      professor = professor
    else
      professor = sepa.getDocente(rut_professor)
      if professor!=nil
        professor.save
      end

    end

    @document = Document.new(document_params)
    @document.professor_id = professor.id
    @document.student_id = student.id

    if @document.save
      redirect_to root_path
    else
      "Error al crear documento"
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update(document_params)
      redirect_to document
    else
      "Error al actualizar"
    end
  end

  def show
    @document = Document.find(params[:id])
  end

  def destroy
    @document = Document.find(params[:id])
    if @document.destroy
      redirect_to root_path
    else
      "Error al eliminar la carrera"
    end
  end


  private
  def document_params
    params.require(:document).permit(:title, :abstract,  :user_id,  :attachment,:rut_professor, :rut_student, :student_v, :professor_v)
  end
  end
