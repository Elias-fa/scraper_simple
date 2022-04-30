# require 'csv'
# require 'open-uri'
# require 'nokogiri'
# require 'net/http'

# def scraping(url)
#   nokogiri_doc = Nokogiri::HTML(Net::HTTP.get(URI(url)))
#   final_array = []

#   nokogiri_doc.search('.v2-lsiting-card_info h3').each do |element|
#     element = element.text
#     final_array << element
#   end

#   final_array.each_with_index do |element, index|
#    puts "#{index + 1} - #{element}"
#   end
# end


# @scraping = scraping('https://www.etsy.com')

# filepath = 'test.csv'

# CSV.open(filepath, 'w', **{ headers: :first_row, col_sep: ',' }) do |csv|
#   @scraping.each_with_index do |item, index|
#     csv << [item, index]
#   end
# end



# class Scraper

#   attr_accessor :doc, :product_names, :site, :name, :link


#   def initialize(site)
#     @site = site
#     @doc = doc
#     @product_names = product_names
#     @name = name
#     @link = link
#     @price_range = [].uniq
#     scrape_product
#   end

#   def get_html
#     @doc = Nokogiri::HTML(Net::HTTP.get(URI(@link)))
#     @product_names = doc.css(".navbar-nav li")
#     product_names
#   end

#   def scrape_product
#     get_html.each {|product|
#       @name = product.css("span").text
#       plink = product.css("a").attr("href").text
#       @link = "#{site}#{link}"
#       link_doc = Nokogiri::HTML(open(@link))
#       pr = link_doc.scan(/[\$£](\d{1,3}(,\d{3})*(\.\d*)?)/)
#       prices = pr_link.text
#         prices.each {|price|
#           if @price_range.include?(price[0]) == false
#             @price_range << price[0]
#             end
#         }

#       new_product = Products.new(@name, @price_range)
#       puts new_product
#   }
#   end

# end

# puts Scraper.new('https://www.etsy.com/search?q=marvel')



# require 'kimurai'

# class JobScraper < Kimurai::Base
#     @name= 'eng_job_scraper'
#     @start_urls = ["https://www.indeed.com/jobs?q=software+engineer&l=New+York%2C+NY"]
#     @engine = :selenium_chrome

#     @@jobs = []

#     def scrape_page
#         doc = browser.current_response
#         returned_jobs = doc.css('td#resultsCol')
#         returned_jobs.css('div.jobsearch-SerpJobCard').each do |char_element|
#             title = char_element.css('h2 a')[0].attributes["title"].value.gsub(/\n/, "")
#             link = "https://indeed.com" + char_element.css('h2 a')[0].attributes["href"].value.gsub(/\n/, "")
#             description = char_element.css('div.summary').text.gsub(/\n/, "")
#             company = description = char_element.css('span.company').text.gsub(/\n/, "")
#             location = char_element.css('div.location').text.gsub(/\n/, "")
#             salary = char_element.css('div.salarySnippet').text.gsub(/\n/, "")
#             requirements = char_element.css('div.jobCardReqContainer').text.gsub(/\n/, "")
#             # job = [title, link, description, company, location, salary, requirements]
#             job = {title: title, link: link, description: description, company: company, location: location, salary: salary, requirements: requirements}

#             @@jobs << job if !@@jobs.include?(job)
#         end  
#     end

#     def parse(response, url:, data: {})

#         10.times do
#             scrape_page

#             if browser.current_response.css('div#popover-background') || browser.current_response.css('div#popover-input-locationtst')
#                 browser.refresh 
#             end
                    
#             browser.find('/html/body/table[2]/tbody/tr/td/table/tbody/tr/td[1]/nav/div/ul/li[6]/a/span').click
#             puts "🔹 🔹 🔹 CURRENT NUMBER OF JOBS: #{@@jobs.count}🔹 🔹 🔹"
#             puts "🔺 🔺 🔺 🔺 🔺  CLICKED NEXT BUTTON 🔺 🔺 🔺 🔺 "
#         end

#         CSV.open('jobs.csv', "w") do |csv|
#             csv << @@jobs
#         end

#         File.open("jobs.json","w") do |f|
#             f.write(JSON.pretty_generate(@@jobs))
#         end
        
#         @@jobs
#     end
# end

# jobs = JobScraper.crawl!

require 'nokogiri'
require 'open-uri'
require 'pry'
require 'net/http'

    # base_url = 'https://www.indeed.com/?q=junior+ruby+on+rails'
    doc = Nokogiri::HTML(URI.open('https://en.wikipedia.org/wiki/Battle_of_the_Little_Bighorn', 'User-Agent' => 'ruby'))
    # doc = Nokogiri::HTML(URI.open(base_url))

    doc.search('span.mw-headline', 'h3').each do |link|
    #  keywords = ['Jr.', 'jr.', 'Jr', 'jr', 'Junior', 'junior', 'Ruby',
    #    'ruby', 'On', 'on', 'Rails', 'rails']
     puts link.content #if link.content.include?('Junior')
    #  (keywords.map { |keyword| keyword})
    end

    ##### will return specific span headline in Wiki page######
    # doc.search('span.mw-headline')
    # doc.css('h3 span')
    ################




    # # base_url = 'https://www.indeed.com/?q=junior+ruby+on+rails'
    # doc = Nokogiri::HTML(URI.open('https://www.indeed.com/jobs?q=Junior%20ruby%20on%20rails%20engineer&l&vjk=4dcc95f710532be3'))
    # # doc = Nokogiri::HTML(URI.open(base_url))

    # doc.css('a').each do |link|
    #   # keywords = %w(Jr. jr. Jr jr Junior junior Ruby ruby On on Rails rails Developer developer Engineer engineer)
    #  array = link.content if link.content.include? 'Junior'
    #  print array
    # end 
    #######this code returned full results from joblistings on indeed using a tag instead of span tag or h2
 
 

    doc = Nokogiri::HTML(URI.open('https://en.wikipedia.org/wiki/Battle_of_the_Little_Bighorn', 'User-Agent' => 'ruby'))
    
    doc.search('span.mw-headline', 'h3').each do |link|
      puts link.content
    end