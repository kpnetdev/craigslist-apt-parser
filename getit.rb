require 'net/http'
require 'nokogiri'


	def make_listing(url)
		good_url = URI(url)
		raw_data = Net::HTTP.get(good_url)
		nokogiri_data = Nokogiri::HTML(raw_data)
		listing_title = nokogiri_data.css('body').children[2].css('h2').map {|m| m.text}.last

		return_hash = Hash.new
		return_hash[:num_bedrooms] = nokogiri_data.css('p b').first.text
		return_hash[:num_bathrooms] = nokogiri_data.css('p b')[1].text
		return_hash[:picture_url] = nokogiri_data.css('img').map {|i| i["src"]}.first
		return_hash[:price] = listing_title.split(' ').first
		return_hash[:neighborhood] = "(#{listing_title.split('(')[1].chomp}"
		return_hash[:google_maps] = nokogiri_data.css('p a').first["href"]
		return_hash[:address] = nokogiri_data.css('div .mapaddress').first.text
		return_hash[:listing_date] = nokogiri_data.css('time').last.text
		return_hash[:listing_details] = nokogiri_data.css('section #postingbody').text
		return_hash[:listing_title] = nokogiri_data.css('body').children[2].css('h2').map {|m| m.text}.last
		return_hash
	end
