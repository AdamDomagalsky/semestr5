#!/usr/bin/ruby


require 'nokogiri'
require 'open-uri'

mainpage =  open('https://en.wikipedia.org/wiki/Main_Page')
mainpage_parsed = Nokogiri::HTML(mainpage)
p mainpage_parsed.css('.interlanguage-link-target').map {|l| l.text} 
