class DescargasController < ApplicationController
  before_action :set_descarga, only: [:show, :edit, :update, :destroy]

  # GET /descargas
  # GET /descargas.json
  def index
    @descargas = Descarga.all
  end

  # GET /descargas/1
  # GET /descargas/1.json
  def show
  end

  # GET /descargas/new
  def new
    @descarga = Descarga.new
  end

  # GET /descargas/1/edit
  def edit
  end

  # POST /descargas
  # POST /descargas.json
  def create
    @descarga = Descarga.new(descarga_params)

    respond_to do |format|
      if @descarga.save
        format.html { redirect_to @descarga, notice: 'Descarga was successfully created.' }
        format.json { render :show, status: :created, location: @descarga }
      else
        format.html { render :new }
        format.json { render json: @descarga.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /descargas/1
  # PATCH/PUT /descargas/1.json
  def update
    respond_to do |format|
      if @descarga.update(descarga_params)
        format.html { redirect_to @descarga, notice: 'Descarga was successfully updated.' }
        format.json { render :show, status: :ok, location: @descarga }
      else
        format.html { render :edit }
        format.json { render json: @descarga.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descargas/1
  # DELETE /descargas/1.json
  def destroy
    @descarga.destroy
    respond_to do |format|
      format.html { redirect_to descargas_url, notice: 'Descarga was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_descarga
      @descarga = Descarga.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def descarga_params
      params.require(:descarga).permit(:certificado, :email)
    end
end
