class ProfilUsersController < ApplicationController
    before_action :authenticate_user!
  before_action :set_user

  def show
    # Code pour afficher le profil de l'utilisateur
  end

  def delete
    @user = current_user
    @user.cart.destroy
    @user.destroy
    sign_out @user
    redirect_to root_path
  end
  private

  def set_user
    @user = current_user
  end
end
