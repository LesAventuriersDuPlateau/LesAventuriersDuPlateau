class PseudoController < ApplicationController

    def update
        @user = current_user
    
        if @user.update(user_params)
            redirect_to root_path, notice: "Votre pseudo a été mis à jour avec succès."
        else
            render :edit
        end
    end

    private
        
    def user_params
        params.require(:user).permit(:pseudo)
    end
end
