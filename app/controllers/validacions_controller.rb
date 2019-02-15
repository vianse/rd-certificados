class ValidacionsController < ApplicationController
  before_action :set_validacion, only: [:show, :edit, :update, :destroy]

  # GET /validacions
  # GET /validacions.json
  def index
    if cookies[:admin_id]
        
    else
      redirect_to "/"
    end
    @validacions = Validacion.all
  end

  # GET /validacions/1
  # GET /validacions/1.json
  def show
  end

  # GET /validacions/new
  def new
    @validacion = Validacion.new
  end

  # GET /validacions/1/edit
  def edit
  end

  # POST /validacions
  # POST /validacions.json
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

  # PATCH/PUT /validacions/1
  # PATCH/PUT /validacions/1.json
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

  # DELETE /validacions/1
  # DELETE /validacions/1.json
  def destroy
    @validacion.destroy
    respond_to do |format|
      format.html { redirect_to validacions_url, notice: 'Validacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_validacion
      @validacion = Validacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def validacion_params
      params.require(:validacion).permit(:numero)
    end
end
