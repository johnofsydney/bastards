require 'nokogiri'
require 'open-uri'
require 'httparty'

class Scraper
  def initialize
  end

  def fetch_aph
    all_results = []

    page_one_results = fetch_aph_one_page("https://www.aph.gov.au/Senators_and_Members/Parliamentarian_Search_Results?page=1&q=&mem=1&sen=1&par=-1&gen=0&ps=96&st=1")
    page_two_results = fetch_aph_one_page("https://www.aph.gov.au/Senators_and_Members/Parliamentarian_Search_Results?page=2&q=&mem=1&sen=1&par=-1&gen=0&ps=96&st=1")
    page_three_results = fetch_aph_one_page("https://www.aph.gov.au/Senators_and_Members/Parliamentarian_Search_Results?page=3&q=&mem=1&sen=1&par=-1&gen=0&ps=96&st=1")

    all_results << page_one_results
    all_results << page_two_results
    all_results << page_three_results

    all_results.flatten.uniq
  end

  def fetch_aph_one_page(address)
    page = HTTParty.get(address)
    nokogiri_page = Nokogiri::HTML(page)

    nokogiri_page.css('.medium-push-2').map do |mp|
      {
        name: mp.css('h4').first.children.children.text,
        electorate: mp.css('dl').first.children[3].text,
        party: mp.css('dd')[-2].children.text
      }
    end
  end

  def fetch_aec
    page = HTTParty.get("https://www.aec.gov.au/profiles/")
    nokogiri_page = Nokogiri::HTML(page)

    nokogiri_page.css('.list tr').map do |entry|
      {
        name: entry.css('td')[0].children.text,
        link: entry.css('td')[3].children.first.attributes['href'].value

      }
    end
  end
end


# https://github.com/jnunemaker/httparty