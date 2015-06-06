class EventosController < ApplicationController
    layout "administracion"
    add_breadcrumb "Eventos", :eventos_path, :options => { :title => "Home" }
    before_filter :authenticate_user!
    load_and_authorize_resource

  def index
   add_breadcrumb "Listado de Eventos", eventos_path, :title => "Volver al index"

    @eventos = Evento.all

    respond_to do |format|
      format.html 
      format.json { render json: @eventos }
    end
  end

  def show
    add_breadcrumb "Mostrar Evento", evento_path(:id), :title => "Volver al index"

    @evento = Evento.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @evento }
    end
  end

  def new
    add_breadcrumb "Nuevo Evento", new_evento_path, :title => "Volver al index"

    @evento = Evento.new

    respond_to do |format|
      format.html 
      format.json { render json: @evento }
    end
  end

  def edit
    add_breadcrumb "Editar Evento", edit_evento_path(:id), :title => "Volver al index"

    @evento = Evento.find(params[:id])
  end

  def create
    @evento = Evento.new(params[:evento])

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento was successfully created.' }
        format.json { render json: @evento, status: :created, location: @evento }
      else
        format.html { render action: "new" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @evento = Evento.find(params[:id])

    respond_to do |format|
      if @evento.update_attributes(params[:evento])
        format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @evento = Evento.find(params[:id])
    @evento.destroy

    respond_to do |format|
      format.html { redirect_to eventos_url }
      format.json { head :no_content }
    end
  end
end
