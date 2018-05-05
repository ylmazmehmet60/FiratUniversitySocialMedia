class DerneksController < ApplicationController
    respond_to :js
    def create
        @user=User.find(params[:user_id])
		@dernek=@user.derneks.create(params[:dernek].permit(:dernekisim, :dernekbasyil, :dernekbityil))
		@dernek.save
	end
	
	def destroy
        @dernek = current_user.derneks.find(params[:id])
        @dernek_id = params[:id]
        @dernek.destroy
        
    end
end
