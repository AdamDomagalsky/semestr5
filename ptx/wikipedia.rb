require 'open-uri'
require 'pp'
require 'tty/prompt'

categories=['Reference','Culture','Geography','Health','History','Mathematics','Nature','People','Philosophy','Religion','Society','Technology']


#1. Podkategorie kategori
#https://en.wikipedia.org/w/api.php?action=categorytree&format=json&category=Society
#2. Mozliwe strony do wyswietlenia
#https://en.wikipedia.org/w/api.php?action=query&format=json&list=categorymembers&cmtype=page&cmlimit=max&cmtitle=Category:Society
#3. Z 2 wybieram zapytanie i wyswietlam strone
#https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=&titles=Baby fashion


def categories(category)
    url="https://en.wikipedia.org/w/api.php?action=categorytree&format=json&category=#{category}"
    URI.parse(url)
        .read.scan(%r{Category:[a-zA-Z_]+})
            .map{|x| x.gsub('Category:','').gsub('_',' ')}
end



def articles(articles)
    url="https://en.wikipedia.org/w/api.php?action=query&format=json&list=categorymembers&cmtype=page&cmlimit=max&cmtitle=Category:#{articles}"
    URI.parse(url).read
end


p articles('society')

def pages(title)
    url="https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=&titles=#{title}"
end









=begin
catDic={}
categories.each {|category| 
    catDic[category]= URI.parse("https://en.wikipedia.org/w/api.php?action=categorytree&category=#{category}&format=json")
        .read.scan(%r{Category:[a-zA-Z_]+})
            .map{|x| x.gsub('Category:','').gsub('_',' ')}
    }


catDic.each {|x,y| p y}


#system "clear" or system "cls"
#1.
def menu(header, categories, lines)
    prompt = TTY::Prompt.new
    selected=prompt.select(header, categories,'back', per_page:lines)
    if selected=='back'
        p 'Stacks pops here'
        
    end

    if prompt.yes?('Would you like to see articles of this category?')
        p '#2\tOk! dawaj'
    else
        p 'I am sad'
    end
    
end


menu('Main Categories',categories,13)
=end