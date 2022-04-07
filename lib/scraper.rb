require 'nokogiri'
require 'open-uri'
require 'httparty'

class Scraper
  def initialize
    @pages = 3
  end

  def fetch
    all_results = []

    (1..@pages).to_a.each do |page_number|
      page_results = fetch_one_page(page_number)
      all_results << page_results
    end

    all_results.flatten
  end

  def fetch_one_page(page_number)
    address = "https://www.aph.gov.au/Senators_and_Members/Parliamentarian_Search_Results?page#{page_number}=&q=&mem=1&sen=1&par=-1&gen=0&ps=96&st=1"
    page = HTTParty.get(address)
    nokogiri_page = Nokogiri::HTML(page)

    page_results = nokogiri_page.css('.medium-push-2').map do |mp|
      {
        name: mp.css('h4').first.children.children.text,
        electorate: mp.css('dl').first.children[3].text,
        party: mp.css('dd')[-2].children.text
      }
    end

    page_results
  end
end
