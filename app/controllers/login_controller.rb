class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'digest'
  def index
    if cookies[:user_id]
      redirect_to "/inbox?token=" + cookies[:user_id]
    else
    end
  end
  def admin
  end
  def user
    if cookies[:user_id]
      key = SecureRandom.random_bytes(32)
      crypt = ActiveSupport::MessageEncryptor.new(key) 
      encrypted_data = crypt.encrypt_and_sign(params[:email])
      redirect_to "/inbox?token=" + encrypted_data
    else
    end
  end
  def validar
    job_query = "%#{params[:email].downcase}%"
    certificado = Certificado.where(:grupoid => params[:grupo]).where(:estado => "Activo").pluck(:grupoid)
   if Usuario.where('email ilike ?', job_query).where(:groupId=>certificado).present?
      puts Usuario.exists?(email: params[:email].downcase)
   
      key = SecureRandom.random_bytes(32)
      crypt = ActiveSupport::MessageEncryptor.new(key) 
      encrypted_data = crypt.encrypt_and_sign(params[:email].downcase)
      cookies[:user_id.downcase] = params[:email].downcase
      redirect_to "/inbox?token=" + encrypted_data
    else
      @mensaje = "El usuario no existe"
      redirect_to "/?mensaje=" + @mensaje 
      
      puts params[:email]
    end
  end
  def validar_admin
    if Admin.exists?(email: params[:email]) and Admin.exists?(password: params[:password])
      key = SecureRandom.random_bytes(32)
      crypt = ActiveSupport::MessageEncryptor.new(key) 
      encrypted_data = crypt.encrypt_and_sign(params[:email])
      cookies[:admin_id] = encrypted_data
      redirect_to "/home/index?token=" + encrypted_data
    else
      redirect_to "/"
    end
  end
end
