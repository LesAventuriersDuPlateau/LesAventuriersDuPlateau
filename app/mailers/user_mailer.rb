class UserMailer < ApplicationMailer
    default from: 'no-reply@lesaventuriersduplateau.fr'

    def welcome_email(user)
        #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
        @user = user # user = variable (données qui vont changé// @user = comme le nom de la variable qui va être appelé quelque part
        #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = 'http://lesaventuriersduplateau.fr/login' 
        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end
end
