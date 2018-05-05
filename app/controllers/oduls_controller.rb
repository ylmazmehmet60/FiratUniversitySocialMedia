class OdulsController < ApplicationController
    respond_to :js
    def create
        @user=User.find(params[:user_id])
		@odul=@user.oduls.create(params[:odul].permit(:odulisim, :odulveren, :odulyil))
		@odul.save
	end
	
	def destroy
        @odul = current_user.oduls.find(params[:id])
        @odul_id = params[:id]
        @odul.destroy
        
    end
end
