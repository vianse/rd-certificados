class CertificadosController < ApplicationController
  
  before_action :set_certificado, only: [:show, :edit, :update, :destroy]

  require 'prawn/table'
  require "open-uri"

  def index
    if cookies[:admin_id]
        
    else
      redirect_to "/"
    end
    if cookies[:user_id]
      redirect_to "/inbox?token=" + cookies[:user_id]
    else

    end
    @certificados = Certificado.all
    @usuarios = Usuario.all
    respond_to do |format|
      format.html
      format.pdf do

         pdf = ReportPdf.new(@certificados,@usuarios, :page_layout => :landscape)
         send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'

     
      end
    end
  end

  def show
    if cookies[:admin_id]
        
    else
      redirect_to "/"
    end
    @certificados = Certificado.all

  end

 
  def new
    if cookies[:admin_id]
      @certificado = Certificado.new
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
    @certificado = Certificado.new(certificado_params)

    respond_to do |format|
      if @certificado.save
        format.html { redirect_to "/certificados", notice: 'Certificado was successfully created.' }
        format.json { render :show, status: :created, location: @certificado }
      else
        format.html { render :new }
        format.json { render json: @certificado.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @certificado.update(certificado_params)
        format.html { redirect_to "/certificados", notice: 'Certificado was successfully updated.' }
        format.json { render :show, status: :ok, location: @certificado }
      else
        format.html { render :edit }
        format.json { render json: @certificado.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @certificado.destroy
    respond_to do |format|
      format.html { redirect_to certificados_url, notice: 'Certificado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_certificado
      @certificado = Certificado.find(params[:id])
    end


    def certificado_params
      params.require(:certificado).permit(:imagen, :nombre, :texto, :grupoid, :serie, :estado, :descargas,:template)
    end
end
