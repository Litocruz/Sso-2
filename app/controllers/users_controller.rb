class UsersController < ApplicationController
  #before_filter :signed_in_user
  before_filter :admin_user

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #sign_in @employee
      flash[:success] = "Nuevo Empleado Creado"
      redirect_to @employee
    else
      render 'new'
    end
  end
end
