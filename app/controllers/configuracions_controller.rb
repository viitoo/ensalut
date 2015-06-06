class ConfiguracionsController < ApplicationController
    layout "administracion"
    add_breadcrumb "Configuraciones", :configuracions_path, :options => { :title => "Home" }
    before_filter :authenticate_user!
    load_and_authorize_resource


  def index
    add_breadcrumb "Listado de Configuraciones", configuracions_path, :title => "Volver al index"
    @configuracions = Configuracion.all

    respond_to do |format|
      format.html 
      format.json { render json: @configuracions }
    end
  end

 
  def show
        add_breadcrumb "Mostrar Configuracion", configuracions_path(:id), :title => "Volver al index"

    @configuracion = Configuracion.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @configuracion }
    end
  end
 
  def new
    @configuracion = Configuracion.new
    add_breadcrumb "Nueva Configuracion", new_configuracion_path, :title => "Volver al index"


    respond_to do |format|
      format.html  
      format.json { render json: @configuracion }
    end
  end

   
  def edit
    add_breadcrumb "Editar Configuracion", edit_configuracion_path(:id), :title => "Volver al index"

    @configuracion = Configuracion.find(params[:id])
  end

   def create
    @configuracion = Configuracion.new(params[:configuracion])

    respond_to do |format|
      if @configuracion.save
        format.html { redirect_to @configuracion, notice: 'Configuracion fue creada exitosamente.' }
        format.json { render json: @configuracion, status: :created, location: @configuracion }
      else
        format.html { render action: "new" }
        format.json { render json: @configuracion.errors, status: :unprocessable_entity }
      end
    end
  end

   def update
    @configuracion = Configuracion.find(params[:id])

    respond_to do |format|
      if @configuracion.update_attributes(params[:configuracion])
        format.html { redirect_to @configuracion, notice: 'Configuracion actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @configuracion.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    @configuracion = Configuracion.find(params[:id])
    @configuracion.destroy

    respond_to do |format|
      format.html { redirect_to configuracions_url }
      format.json { head :no_content }
    end
  end
end
