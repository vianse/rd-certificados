class InboxController < ApplicationController
  require 'prawn/table'
  require "open-uri"
  

  def index
    job_query = "%#{cookies[:user_id].downcase}%"
    @groupId = Usuario.where('email ilike ?', job_query).where(:groupId=>params[:grupo]).pluck(:id).first
    @usuarioId = Usuario.where('email ilike ?', job_query).pluck(:id).first
    @usuarios = Usuario.where(:groupId => params[:grupo]).where('email ilike ?', job_query)
    @usuario = Usuario.where('email ilike ?', job_query).pluck(:groupId)
    @certificados = Certificado.where(:grupoid => [@usuario]).where(:estado => "Activo")
    @certificado = Certificado.where(:grupoid => params[:grupo])
    @certificadoTemplate = Certificado.where(:grupoid => params[:grupo]).pluck(:template).first
    respond_to do |format|
      format.html
      format.pdf do
        d=Certificado.where(:grupoid => params[:grupo]).pluck(:descargas).first
        @des= Descarga.where('email ilike ?', job_query).where(:certificado=>params[:grupo]).first
        if (@des)
        else
          Descarga.create({
            :certificado => params[:grupo],
            :email=>cookies[:user_id].downcase
          })
          u=Certificado.where(:grupoid => params[:grupo]).first
          u.update(:descargas => d.to_i + 1)
        end

        fileName = "Certificado-#{d}.pdf"
        if (@certificadoTemplate == "1")
         pdf = ReportPdf.new(@certificado, @usuarios, :page_layout => :landscape)
        end
        if (@certificadoTemplate == "2")
          pdf = ReportAPdf.new(@certificado, @usuarios, :page_layout => :portrait)
        end
        if (@certificadoTemplate == "3")
          pdf = ReportBPdf.new(@certificado, @usuarios,:page_size => "LEGAL", :page_layout => :landscape)
        end
        if (@certificadoTemplate == "4")
          pdf = ReportCPdf.new(@certificado, @usuarios,:page_size => "LEGAL", :page_layout => :landscape)
        end

         send_data pdf.render, filename: fileName, type: 'application/pdf', disposition: "inline", :skip_page_creation => true
        
      end
    end
  end
end
