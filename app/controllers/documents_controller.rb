class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
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
      redirect_to root_path
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
    params.require(:document).permit(:title, :abstract, :namestudent, :nameprofessor, :lastnameprofessor, :datepublished, :lastnamestudent, :user_id, :career_id, :school_id)
  end
  end
