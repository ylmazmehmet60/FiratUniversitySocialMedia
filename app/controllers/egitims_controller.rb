class EgitimsController < ApplicationController
    respond_to :js
    def create
        @user=User.find(params[:user_id])
		@egitim=@user.egitims.create(params[:egitim].permit(:egitimokul, :egitimbolum, :egitimseviye, :egitimbasyil, :egitimbitisyil))
		@egitim.save

	end
	
	def destroy
        @egitim = current_user.egitims.find(params[:id])
        @egitim_id = params[:id]
        @egitim.destroy
        
    end

    
end



