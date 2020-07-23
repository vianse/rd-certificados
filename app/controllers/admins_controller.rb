class AdminsController < ApplicationController
  before_action :set_admin, only: [ :edit, :update, :destroy]
  def index
    if cookies[:admin_id]
        
    else
      redirect_to "/"
    end
    @admins = Admin.all
  end

  def show
    if cookies[:admin_id]
        
    else
      redirect_to "/"
    end
  end
  def new
    if cookies[:admin_id]
      @admin = Admin.new
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
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to "/admins", notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to "/admins", notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
   
    def set_admin
      @admin = Admin.find(params[:id])
    end
    def admin_params
      params.require(:admin).permit(:email, :password)
    end
end
