require 'nokogiri'
require 'open-uri'
require 'selenium-webdriver'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))


def crypto_name(page)
    name_array = []
    page.xpath("//tr//td[3]//div").map { |name| name_array << name.text}
    return name_array
  end


  def crypto_value(page)
    value_array = []
   page.xpath('//tr//td//div//a/*').map {|value| value_array << value.text}
   return value_array
  end


  def tableau(page)
  crypto_hash = crypto_name(page).zip(crypto_value(page)).to_h
  return crypto_hash
  end

def crypto_tab(page)
    a = [tableau(page)]

    a.each do |hash|
        hash.each do |name, value|
          puts name + ': ' + value
        end
      end
    end

    crypto_tab(page)