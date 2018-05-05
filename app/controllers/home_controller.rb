# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class HomeController < ApplicationController
  before_action :set_user, except: :front
  respond_to :html, :js

  def index
    @post = Post.new
    @friends = @user.all_following.unshift(@user)
    @activities = PublicActivity::Activity.where(key: 'post.create').order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    
    @movements = PublicActivity::Activity.where.not(key: 'post.create' ,trackable_type: 'Event').order(created_at: :desc).paginate(page: params[:page], per_page: 50)
    
    #@activities = PublicActivity::Activity.where(owner_id: @friends).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def front
    @activities = PublicActivity::Activity.joins("INNER JOIN users ON activities.owner_id = users.id").where(key: 'post.create').order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @yeniuyeler=User.all.order(created_at: :asc).last(10).reverse
    @enaktifuyeler=User.all.order(posts_count: :asc,sash_id: :asc).last(10).reverse
   
  end
  
  def portal
   
    @yeniuyeler=User.all.order(created_at: :asc).last(10).reverse
    require 'openssl'
    require 'open-uri'
    require 'nokogiri'
    @baslik = []
    @img = []
    @icerik = []
    @tarih=icerik = []
    @link =[]
    doc = Nokogiri::HTML(open('http://www.firat.edu.tr/tr/haberler', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE ,'User-Agent' => 'Nooby'))
    haberler = doc.css('.views-row')
    haberler.each do |entry|
      img= entry.css('div.views-field>div.field-content>a>img').map { |l| p l.attr('src') }
      @img.push(img)
      baslik= entry.css('div.views-field-title>span.field-content>a').text
      @baslik.push(baslik)
      icerik= entry.css('div.views-field>div.field-content>p').text
      @icerik.push(icerik)
      tarih= entry.css('span.views-field-created>span.field-content').text
      @tarih.push(tarih)
      link= entry.css('div.views-field-title>span.field-content>a').map { |l| p l.attr('href') }
      @link.push(link)

    end  
    
  end  
  
  def cv
  
  end  
  
  def statistic
  
  end  
  
  

  def find_friends
    @friends = @user.all_following
    @users =  User.where.not(id: @friends.unshift(@user)).paginate(page: params[:page])
  end

  private
  def set_user
    @user = current_user
    
  end
end
