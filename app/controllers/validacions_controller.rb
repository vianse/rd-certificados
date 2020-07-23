class ValidacionsController < ApplicationController
  before_action :set_validacion, only: [:show, :edit, :update, :destroy]

  def index
    if cookies[:admin_id]
        
    else
      redirect_to "/"
    end
    @validacions = Validacion.all
  end

  def show
    if cookies[:admin_id]
        
    else
      redirect_to "/"
    end
  end

  def new
    if cookies[:admin_id]
      @validacion = Validacion.new
    else
      redirect_to "/"
    end
    
  end


  def edit
    if cookies[:admin_id]
        
    else
      redirect_to "/"
    end
  end

  def create
    @validacion = Validacion.new(validacion_params)

    respond_to do |format|
      if @validacion.save
        format.html { redirect_to "/home/index", notice: 'Validacion was successfully created.' }
        format.json { render :show, status: :created, location: @validacion }
      else
        format.html { render :new }
        format.json { render json: @validacion.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @validacion.update(validacion_params)
        format.html { redirect_to "/home/index", notice: 'Validacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @validacion }
      else
        format.html { render :edit }
        format.json { render json: @validacion.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @validacion.destroy
    respond_to do |format|
      format.html { redirect_to validacions_url, notice: 'Validacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
 
    def set_validacion
      @validacion = Validacion.find(params[:id])
    end
    def validacion_params
      params.require(:validacion).permit(:numero)
    end
end
