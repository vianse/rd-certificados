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
    if Usuario.where(:email.downcase => params[:email].downcase).where(:groupId=>params[:grupo]).present?
      puts Usuario.exists?(email: params[:email].downcase)
      
      #crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
      #cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt
      #cipher = Digest::SHA1.hexdigest params[:email]
      #encrypted_data = Digest::SHA1.hexdigest params[:email]
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
      #crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
      #cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt
      #cipher = Digest::SHA1.hexdigest params[:email]
      
     # encrypted_data = Digest::SHA1.hexdigest params[:email]
      #encrypted_data = crypt.encrypt_and_sign(params[:email])
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
