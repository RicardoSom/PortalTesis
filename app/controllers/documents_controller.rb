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
    rut_professor = params['document']['rut_professor']+'-'+params['document']['professor_v']

    sepa = SepaApi.new
    student = sepa.getEstudiante(rut_student)
    student = Student.find_by_rut(student.rut)

    professor = sepa.getDocente(rut_professor)
    if professor != nil
    professor = Professor.find_by_rut(professor.rut)
    end


    if professor!=nil and student!=nil
    @document = Document.new(document_params)
    @document.professor_id = professor.id
    @document.student_id = student.id
    @document.save
    redirect_to root_path
    else
      respond_to do |format|
          format.html{redirect_to root_path(@document), notice: 'No se pudo guardar el documento'}
      end
    end

    #if @document.save
    #  redirect_to root_path
    #else
    #  "Error al crear documento"
    #end
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
