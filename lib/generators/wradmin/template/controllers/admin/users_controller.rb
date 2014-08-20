class Admin::UsersController < ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  layout "admin"
  before_action :authenticate_user!

  def index
    @admin_users = Admin::User.all
  end

  def show
    redirect_to edit_admin_user_path(params[:id])
  end

  def new
    if current_user.autorization == false
      redirect_to admin_users_path
    end
    @admin_user = Admin::User.new
  end

  def edit
    if current_user.autorization == false
      redirect_to admin_users_path
    end
  end

  def view
    @admin_user = Admin::User.find(params[:id])
  end

  def create
    @admin_user = Admin::User.new(admin_user_params)
    if @admin_user.save
      redirect_to @admin_user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to @admin_user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_user
      @admin_user = Admin::User.find(params[:id])
    end

    def admin_user_params
      params.require(:admin_user).permit(:name, :surname, :email, :password, :avatar, :birthday, :ocupation, :phone, :autorization)


    end
end
