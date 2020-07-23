class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    if cookies[:admin_id]
      @groups = Group.all
    else
      redirect_to "/"
    end
   
  end

  def show
    if cookies[:admin_id]
      
    else
      redirect_to "/"
    end
  end


  def new
    if cookies[:admin_id]
      @group = Group.new
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
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to "/home/index", notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to "/home/index", notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to "/home/index", notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_group
      @group = Group.find(params[:id])
    end
    def group_params
      params.require(:group).permit(:name, :number)
    end
end
