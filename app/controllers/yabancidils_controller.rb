class YabancidilsController < ApplicationController
    respond_to :js
    def create
        @user=User.find(params[:user_id])
		@yabancidil=@user.yabancidils.create(params[:yabancidil].permit(:yabancidilisim, :yabancidilsinavisim, :yabancidilyil, :yabancidilpuan))
		@yabancidil.save
	end
	
	def destroy
        @yabancidil = current_user.yabancidils.find(params[:id])
        @yabancidil_id = params[:id]
        @yabancidil.destroy
        
    end
end
