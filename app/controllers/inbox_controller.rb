class InboxController < ApplicationController
  require 'prawn/table'
  require "open-uri"
  require 'openssl'

  def index
    cookies[:user_id] = params[:token]
   # crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
   # decrypted_back = crypt.decrypt_and_verify(params[:token])
   #cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt
   #cipher = Digest::SHA1.hexdigest params[:token]
   key = SecureRandom.random_bytes(32)
   crypt = ActiveSupport::MessageEncryptor.new(key)
   decrypted_back = crypt.decrypt_and_verify(params[:token])
    puts cipher
    @usuarios = Usuario.where(:groupId => params[:grupo]).where(:email=>decrypted_back)
    @usuario = Usuario.where(:email=>decrypted_back).pluck(:groupId)
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
