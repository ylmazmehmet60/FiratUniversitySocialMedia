class DeneyimsController < ApplicationController
    respond_to :js
    def create
        @user=User.find(params[:user_id])
		@deneyim=@user.deneyims.create(params[:deneyim].permit(:deneyimkurumisim, :deneyimbirimisim, :deneyimbolumisim, :deneyimunvan, :deneyimbasyil, :deneyimbityil))
		@deneyim.save
	end
	
	def destroy
        @deneyim = current_user.deneyims.find(params[:id])
        @deneyim_id = params[:id]
        @deneyim.destroy
        
    end
end
