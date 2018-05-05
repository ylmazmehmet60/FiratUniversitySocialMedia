class SocsController < ApplicationController
    respond_to :js
    def create
        
        @user=User.find(params[:user_id])
    	@soc=@user.socs.create(params[:soc].permit(:socname,:socbody))
    	@soc.save
            
	end
	
	def destroy
        @soc = current_user.socs.find(params[:id])
        @soc_id = params[:id]
        @soc.destroy
        
    end
  
end