require 'rubygems'
require 'nokogiri'
require 'dotenv'
require 'pry'
require 'rspec'
require 'rubocop'
require 'open-uri'

def access_page
    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    return page
end
      

def final_hash
    page = access_page
    all_names = page.xpath('/html/body/div[1]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div')
    #puts all_names
    all_prices = page.xpath('/html/body/div[1]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a')
    #puts all prices

    names_list = Array.new
        all_names.each do |name|
        names_list << name.text
        end

    prices_list = Array.new
        all_prices.each do |price|
        prices_list << price.text
        end

    final_list = Hash.new 
    names_list.zip(prices_list){|k,v|final_list[k] = v}
    hello = final_list.each_slice(1).map(&:to_h)
    return hello 
end

def perform 
    access_page
    final_hash
end

p perform