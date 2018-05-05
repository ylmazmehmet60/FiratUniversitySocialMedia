class ProjelersController < ApplicationController
    respond_to :js
    def create
        @user=User.find(params[:user_id])
		@projeler=@user.projelers.create(params[:projeler].permit(:projelerisim, :projelerkurum, :projelergorev, :projelerbas, :projelerbit))
		@projeler.save
	end
	
	def destroy
        @projeler = current_user.projelers.find(params[:id])
        @projeler_id = params[:id]
        @projeler.destroy
        
    end
end
