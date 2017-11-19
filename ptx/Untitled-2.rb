catDic={}
categories.each {|category| 
    catDic[category]= getCategories(category)
    }



def menu(header, categories)
    prompt = TTY::Prompt.new
    selected=prompt.select(header, categories,'back', per_page:14)
    
        case selected
    when 'back'
        begin
            p 'Stacks pops here'
            menu('Categories', $stack.shift)
        end
    else
        begin
            if prompt.yes?("Would you like to see articles of #{selected} category?")
                p "getArticles(#{selected})"
                prompt = TTY::Prompt.new
                selected=prompt.select("Articles of #{selected} category", getArticles(selected),'back', per_page:14)
                if(selected=='back')
                    return
                end
                getPages(selected)
            else
                p "getCategories(#{selected})"
                $stack<<getCategories(selected)
                menu("Subcategories of: #{selected}", $stack.last)
            end
        end
    end

    p 'KONIEEEC'
end

menu('Main Categories',categories)
