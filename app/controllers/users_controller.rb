# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, :socialmedialinks, :kisisel, :projeler
  before_action :check_ownership, only: [:edit, :update, :editsocialmedia, :egitimekle, :yabancidilekle, :deneyimekle, :dernekekle, :odulekle, :hobiekle, :yetenekekle, :projelerekle]
  respond_to :html, :js

  def show
    @activities = PublicActivity::Activity.where(owner: @user).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def socialmedialinks
    @socexist=Soc.where(user_id: @user).count
    @socall=Soc.where(user_id: @user).all
    
  end
  
  def kisisel
      @showegitim=Egitim.where(user_id: @user).all
      @countegitim=Egitim.where(user_id: @user).count
      
      @showyabancidil=Yabancidil.where(user_id: @user).all
      @countyabancidil=Yabancidil.where(user_id: @user).count
      
      @showdeneyim=Deneyim.where(user_id: @user).all
      @countdeneyim=Deneyim.where(user_id: @user).count
      
      @showdernek=Dernek.where(user_id: @user).all
      @countdernek=Dernek.where(user_id: @user).count
      
      @showodul=Odul.where(user_id: @user).all
      @countodul=Odul.where(user_id: @user).count
      
      @showhobi=Hobi.where(user_id: @user).all
      @counthobi=Hobi.where(user_id: @user).count
      
      @showyetenek=Yetenek.where(user_id: @user).all
      @countyetenek=Yetenek.where(user_id: @user).count
      
  end
  
  def projeler
      @showprojeler=Projeler.where(user_id: @user).all
      @countprojeler=Projeler.where(user_id: @user).count  
  end  
  
  def deactivate
  end

  def friends
    @friends = @user.following_users.paginate(page: params[:page])
  end

  def followers
    @followers = @user.user_followers.paginate(page: params[:page])
  end

  def mentionable
    render json: @user.following_users.as_json(only: [:id, :name]), root: false
  end

  private

  def user_params
    params.require(:user).permit(:name, :about, :avatar, :cover,
                                 :sex, :dob, :location, :phone_number,
                                 :ogrencilikdurum ,:bolum)
  end

  def check_ownership
    redirect_to current_user, notice: 'Not Authorized' unless @user == current_user
  end

  def set_user
    @user = User.friendly.find_by(slug: params[:id]) || User.find_by(id: params[:id])
    render_404 and return unless @user
  end
end
