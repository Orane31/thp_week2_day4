require 'rubygems'
require 'nokogiri'
require 'dotenv'
require 'pry'
require 'rspec'
require 'rubocop'
require 'open-uri'

=begin
Tu dois être capable d'obtenir un e-mail de mairie à partir de la page de cette dernière (pas en partant du listing complet des mairies). Fais d'abord une méthode get_townhall_email(townhall_url) qui récupère l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes.
Une fois que tu sais le faire pour une mairie, tu vas vouloir industrialiser et répéter ça sur tout l'annuaire du Val d'Oise. La prochaine étape est de coder une méthode get_townhall_urls qui récupère les URLs de chaque ville du Val d'Oise.
=end

avernes_url = 'http://annuaire-des-mairies.com/95/avernes.html'

def get_townhall_email(townhall_url)
    townhall_page = Nokogiri::HTML(URI.open(townhall_url))
    email = townhall_page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]')
    return email.text
end

#p get_townhall_email(avernes_url)


def get_townhall_names
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    towns_names = page.xpath('//a[contains(@href, "./")]')
    all_names = Array.new
    towns_names.each do |names|
        all_names << names.text
    end
    return all_names
end

#p get_townhall_names

def get_townhall_urls
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    towns_names = page.xpath('//a[contains(@href, "./")]')
    towns_links = Array.new
    towns_names.each do |link|
        towns_links << "http://annuaire-des-mairies.com/" +(link[:href])[2..-1]
    end
    return towns_links
end

#p get_townhall_urls


def perform
    
    mails_list = Array.new
    get_townhall_urls.each do |url|
        mails_list << get_townhall_email(url)
    end

    together = Hash.new
    get_townhall_names.zip(mails_list){|k,v|together[k] = v}
    final_list = together.each_slice(1).map(&:to_h)
    return final_list
    
end

p perform

