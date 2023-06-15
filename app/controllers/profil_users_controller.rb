class ProfilUsersController < ApplicationController
    before_action :authenticate_user!
  before_action :set_user

  def show
    # Code pour afficher le profil de l'utilisateur
  end

  private

  def set_user
    @user = current_user
  end
end
