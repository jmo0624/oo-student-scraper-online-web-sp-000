

#<<<<<<< HEAD

=======
>>>>>>> 20fa4da8255e801a5f1311490258149a74625ae3
require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper


  def self.scrape_index_page(index_url)
#<<<<<<< HEAD

    doc = Nokogiri::HTML(open(index_url))
    students = Array.new
    doc.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        name = student.css(".student-name").text
        location = student.css(".student-location").text
        profile_url = "#{student.attr("href")}"
        students << {name: name, location: location, profile_url: profile_url}
      end
    end
    students	  
  end


  def self.scrape_profile_page(profile_url)
#=======
    
    students_hash = []
    
    html = Nokogiri::HTML(open(https://learn-co-curriculum.github.io/student-scraper-test-page/index.html))
    
    html.css(".student-card").collect do |student|
      hash = {
        name: student.css(h4.student-name).text,
        location: student.css(p.student-location).text,
        profile_url: "http://students.learn.co/" + student.css("a").attribute("href")
      }
      
      students_hash << hash
    end
    students_hash
  end

  def self.scrape_profile_page(index_url)
    
    students_hash = {}
    
    html = Nokogiri::HTML(open(https://learn-co-curriculum.github.io/student-scraper-test-page/index.html))
    
    html.css("div.social-icon-container a").each do |student|
      url = student.attribute("href")
      students_hash[:twitter_url] = url if url.include?("twitter")
      students_hash[:linkedin_url] = url if url.include?("linkedin")
      students_hash[:github_url] = url if url.include?("github")
      students_hash[:blog_url] = url if student.css("img").attribute("src").text.include?("rss")
    end
      students_hash[:profile_quote] = html.css("div.profile-quote").text
      students_hash[:bio] = html.css("div.bio-content p").text
    students_hash
  end
#>>>>>>> 20fa4da8255e801a5f1311490258149a74625ae3

    doc = Nokogiri::HTML(open(profile_url))
	   student = Hash.new


     social_icons = doc.css("div.social-icon-container a").collect {|x| x.attribute("href").value}
    social_icons.each do |social_icon|
      if social_icon.include?("linkedin")
        student[:linkedin] = social_icon
      elsif social_icon.include?("github")
        student[:github] = social_icon
      elsif social_icon.include?("twitter")
        student[:twitter] = social_icon
      else
        student[:blog] = social_icon
      end
    end
    # if doc.css("div.bio-content.content-holder div.description-holder p")
      student[:bio] = doc.css("div.bio-content.content-holder div.description-holder p").text
    # end
    # if doc.css(".profile-quote")
      student[:profile_quote] = doc.css(".profile-quote").text
    # end
    student
  end
end
