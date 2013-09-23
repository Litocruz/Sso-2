class SessionsController < ApplicationController

  def new
    if signed_in?
      redirect_to employees_path
    end
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or employees_path
    else
      #flash.now hace que el mensaje no persista en subsecuentes paginas listing 8.12
      flash.now[:error] = 'Combinacion de email y password erroneo'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
