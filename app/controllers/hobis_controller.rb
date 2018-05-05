class HobisController < ApplicationController
    respond_to :js
    def create
        @user=User.find(params[:user_id])
		@hobi=@user.hobis.create(params[:hobi].permit(:hobiisim))
		@hobi.save
	end
	
	def destroy
        @hobi = current_user.hobis.find(params[:id])
        @hobi_id = params[:id]
        @hobi.destroy
        
    end
end
