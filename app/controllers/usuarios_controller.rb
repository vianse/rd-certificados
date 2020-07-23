class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  def index
    @usuarios = Usuario.all
    if cookies[:user_id]
      redirect_to "/inbox?token=" + cookies[:user_id]
    else
      if cookies[:admin_id]
        
      else
        redirect_to "/"
      end
    end
  end

  def import
    Usuario.import(params[:file])
  
    redirect_to "/usuarios", notice: 'Products imported.'
  end

  def show
    if cookies[:admin_id]
     
    else
      redirect_to "/"
    end
  end

  def new
    if cookies[:admin_id]
      @usuario = Usuario.new
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

  def error
    @usuario = Usuario.find(params[:id])
  end

  def editar
    job_query = "%#{cookies[:user_id].downcase}%"
    @validacion = Usuario.where('email ilike ?', job_query).where(:groupId => params[:grupo]).pluck(:conteo).first
    @validacions = Validacion.all.pluck(:numero).first
    @idU1= Usuario.where('email ilike ?', job_query).where(:groupId => params[:grupo]).pluck(:id).first
    puts @validacion
    if @validacion == @validacions
      redirect_to "/error?id=" + @idU1.to_s
    else
    @idU= Usuario.where('email ilike ?', job_query).where(:groupId => params[:grupo]).pluck(:id).first
    puts @idU
    @usuario = Usuario.find(@idU)
    end
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to "/usuarios", notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update

        respond_to do |format|
          if @usuario.update(usuario_params)

          
              format.html { redirect_to "/usuarios", notice: 'Datos guardados satisfactoriamente.' }
              format.json { render :show, status: :ok, location: @usuario }

            
          else
            format.html { render :edit }
            format.json { render json: @usuario.errors, status: :unprocessable_entity }
          end
        end

  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:title, :name, :lastName, :email, :groupId, :userId,:folio,:conteo)
    end
end
