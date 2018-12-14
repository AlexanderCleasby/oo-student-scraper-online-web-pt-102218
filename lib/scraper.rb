require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    #puts doc.css('.student-card')[0]
    doc.css('.student-card a').map{|card|
    {:name => card.css('.student-name').text,
      :location=> card.css('.student-location').text,
      :profile_url=>"#{card.attr('href')}"
      }}
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    #binding.pry
    out = {
      #:twitter=>doc.css('.social-icon-container a').attr('href'),
      #:linkedin=>doc.css('.social-icon-container a')[1].attr('href'),
      #:github=>doc.css('.social-icon-container a')[2].attr('href'),
      #:blog=>doc.css('.social-icon-container a')[3].attr('href'),
      :profile_quote=>doc.css('.profile-quote').text,
      :bio=>doc.css('.description-holder p').text
    }
    doc.css('.social-icon-container a').map{|e| e.attr('href')}.each{|href|
      if href.include?('twitter')
        out[:twitter] = href
      elsif href.include?('linkedin')
        out[:linkedin]=href
      elsif href.include?('github')
        out[:github]=href
      else
        out[:blog]=href
      end
    }
    out
  end


end

