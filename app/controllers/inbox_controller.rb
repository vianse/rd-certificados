class InboxController < ApplicationController
  require 'prawn/table'
  require "open-uri"
  def index
    cookies[:user_id] = params[:token]
   # crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
   # decrypted_back = crypt.decrypt_and_verify(params[:token])
   cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').decrypt
   cipher_d = Digest::SHA1.hexdigest params[:token]
   puts cipher_d
    @usuarios = Usuario.where(:groupId => params[:grupo]).where(:email=>cipher_d)
    @usuario = Usuario.where(:email=>cipher_d).pluck(:groupId)
    @certificados = Certificado.where(:grupoid => [@usuario])
    @certificado = Certificado.where(:grupoid => params[:grupo])
    respond_to do |format|
      format.html
      format.pdf do
        d=Certificado.where(:grupoid => params[:grupo]).pluck(:descargas).first
        u=Certificado.where(:grupoid => params[:grupo]).first
        u.update(:descargas => d.to_i + 1)
        fileName = "Certificado-#{d}.pdf"
         pdf = ReportPdf.new(@certificado, @usuarios, :page_layout => :landscape)
         send_data pdf.render, filename: fileName, type: 'application/pdf'
        
      end
    end
  end
end
