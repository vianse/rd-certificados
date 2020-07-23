class DescargasController < ApplicationController
  before_action :set_descarga, only: [:show, :edit, :update, :destroy]

  def index
    @descargas = Descarga.all
  end

  def show
  end


  def new
    @descarga = Descarga.new
  end

  def edit
  end

 
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

  def destroy
    @descarga.destroy
    respond_to do |format|
      format.html { redirect_to descargas_url, notice: 'Descarga was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_descarga
      @descarga = Descarga.find(params[:id])
    end

   
    def descarga_params
      params.require(:descarga).permit(:certificado, :email)
    end
end
