class YeteneksController < ApplicationController
    respond_to :js
    def create
        @user=User.find(params[:user_id])
		@yetenek=@user.yeteneks.create(params[:yetenek].permit(:yetenekisim, :yetenekbdy))
		@yetenek.save
	end
	
	def destroy
        @yetenek = current_user.yeteneks.find(params[:id])
        @yetenek_id = params[:id]
        @yetenek.destroy
        
    end
end
