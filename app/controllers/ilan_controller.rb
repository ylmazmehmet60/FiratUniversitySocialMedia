class IlanController < ApplicationController
    require 'openssl'
    require 'open-uri'
    require 'nokogiri'
    
    
    def list
        @jobTitle = []
        @company_name = []
        @location = []
        @date = []
        @link = []
        page1_link='https://www.yenibiris.com/yazilim-muhendisi-is-ilanlari'
        page2_link=page1_link+'?sayfa=2'
        page3_link=page1_link+'?sayfa=3'
        page4_link=page1_link+'?sayfa=4'
        
      
        begin
          page1 = Nokogiri::HTML(open(page1_link, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE ,'User-Agent' => 'Nooby'))
          page2 = Nokogiri::HTML(open(page2_link, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE ,'User-Agent' => 'Nooby'))
          page3 = Nokogiri::HTML(open(page3_link, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE ,'User-Agent' => 'Nooby'))
          page4 = Nokogiri::HTML(open(page4_link, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE ,'User-Agent' => 'Nooby'))
          def get_info(doc)
            get_it = doc.css('.listViewHoverContent')
            get_it.each do |entry|
              jobTitle= entry.css('div.jobTitleLnk>a').text
              @jobTitle.push(jobTitle)
              
              link= entry.css('div.jobTitleLnk>a').map { |l| p l.attr('href') }
              @link.push(link)
              
              company_name= entry.css('div.jobCompanyLnk').text
              @company_name.push(company_name)
              
              location= entry.css('div.fs13').text
              @location.push(location)
              
              date= entry.css('div.orderDateTxt').text
              @date.push(date)
            end  
          end
          get_info(page1)
          get_info(page2)
          get_info(page3)
          get_info(page4)
          
          @record_count=@jobTitle.count
        rescue => e
          puts e.message
        end
  
    end 
    
    def detay
        @merge = params[:to]
        @merge="https://www.yenibiris.com"+@merge
        @qualifications = []
        @summary_info = []
        @summary_info_detail = []
        
        doc = Nokogiri::HTML(open(@merge, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE ,'User-Agent' => 'Nooby'))
        get_it = doc.css('.detailContent')
        
        get_it.css('div.mb20>ul>li').each do |entry|
          @qualifications.push(entry.content)
        end 
        
        if @qualifications.count == 0 
            qualifications= get_it.css('div.mb20').text
            @qualifications.push(qualifications)
        end  

        @gn_count=@qualifications.count
        
        # İş Tanımı & Aranan Nitelikler
        get_it.css('ul.list-unstyled>li>label').each do |entry|
          @summary_info.push(entry.text)
        end 
        
        get_it.css('ul.list-unstyled>li>span.col-xs-12').each do |entry|
          @summary_info_detail.push(entry.text)
        end 
        
        @si_count=@summary_info.count
        
        # header

        @header_title= doc.css('h1.mt0').text
        @company_title= doc.css('div.companyTitle>a').text
        @location_title= doc.css('div.locationTxt>a').text
        @header_img=doc.css('a.logoCompanyLnk>img').map { |l| p l.attr('src') }
        @header_img='https://www.yenibiris.com'+@header_img.join(",")
    
    end    
end
