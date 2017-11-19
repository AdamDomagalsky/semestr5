require 'open-uri'
require 'pp'
require 'tty/prompt'
require 'tty/pager'
require 'json'

categories=['Reference','Culture','Geography','Health','History','Mathematics','Nature','People','Philosophy','Religion','Society','Technology']

def getCategories(category)
    url="https://en.wikipedia.org/w/api.php?action=categorytree&format=json&category=#{category}"
    URI.parse(url)
        .read.scan(%r{Category:[a-zA-Z_]+})
            .map{|x| x.gsub('Category:','').gsub('_',' ')}
end
#p getCategories('health')


def getArticles(articles)
    url="https://en.wikipedia.org/w/api.php?action=query&format=json&list=categorymembers&cmtype=page&cmlimit=max&cmtitle=Category:#{articles}"
    JSON.parse(URI.parse(url).read)['query']['categorymembers'].map{|x| x['title']}
end
#p getArticles('society')

def getPages(title)
    url="https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=&titles=#{title}"
    text=JSON.parse(URI.parse(url).read)['query']['pages'].map{|k,v| v}[0]['extract']
    pager = TTY::Pager.new
    pager.page(text)
end
#p getPages('Society')
#catDic.each {|x,y| p y}
#system "clear" or system "cls"
#1.

flag=true
stack=[categories]
title=['Main']
while flag do
    prompt = TTY::Prompt.new
    selected=prompt.select("#{title.last} Categories", stack.last,'back', per_page:14)
    if(selected!='back')
        stack<<getCategories(selected)
        title<<"Subcategories of: #{selected}"
        if prompt.yes?("Would you like to see articles of #{selected} category?")
            selected=prompt.select("Articles of #{selected} category", getArticles(selected),'back', per_page:14)
            if(selected=='back')
                stack.pop
                title.pop
                if(stack.empty?)
                    flag=false
                end
            end
            getPages(selected)
        end
    else
        stack.pop
        title.pop
        if(stack.empty?)
            flag=false
        end
    end
end

