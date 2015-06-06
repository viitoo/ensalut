class ComplaintsController < ApplicationController

     layout "administracion",:except => :questionari

    add_breadcrumb "Denuncias", :complaints_path, :options => { :title => "Home" }
    before_filter :authenticate_user!
    load_and_authorize_resource


    def questionari
      @denuncia = Complaint.find(params[:id])
      @usuario = User.find(@denuncia.user_id)
    end

  def index
        add_breadcrumb "Listado de Denuncias", complaints_path, :title => "Volver al index"

    if current_user.has_role? :admin
       @complaints = Complaint.all
    else
       @complaints = Complaint.where(:user_id => current_user.id)
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @complaints }
    end
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
            add_breadcrumb "Mostrar Denuncia", complaints_path(:id), :title => "Volver al index"

    @complaint = Complaint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @complaint }
    end
  end

  # GET /complaints/new
  # GET /complaints/new.json
  def new
        add_breadcrumb "Nueva Denuncia", new_complaint_path, :title => "Volver al index"

    @complaint = Complaint.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @complaint }
    end
  end

  # GET /complaints/1/edit
  def edit
        add_breadcrumb "Editar Denuncia", edit_complaint_path(:id), :title => "Volver al index"

    @complaint = Complaint.find(params[:id])
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @complaint = Complaint.new(params[:complaint])

    respond_to do |format|
      if @complaint.save
        format.html { redirect_to @complaint, notice: 'Denuncia creada exitosamente.' }
        format.json { render json: @complaint, status: :created, location: @complaint }
      else
        format.html { render action: "new" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /complaints/1
  # PUT /complaints/1.json
  def update
    @complaint = Complaint.find(params[:id])

    respond_to do |format|
      if @complaint.update_attributes(params[:complaint])
        format.html { redirect_to @complaint, notice: 'Denuncia actualizada exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint = Complaint.find(params[:id])
    @complaint.destroy

    respond_to do |format|
      format.html { redirect_to complaints_url }
      format.json { head :no_content }
    end
  end
end
