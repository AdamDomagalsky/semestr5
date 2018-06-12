#!/usr/bin/env ruby
# ruby run.rb < example.in


deleted=0
# print all the lines in every file passed via command line that contains login
ARGF.each do |line|
    sum=0
    line.split.each { |w| 
            if w=~/[0-9]+/
                sum = sum + Integer(w)
            elsif w=='#'
                break;
            end
    }

    if sum <= 100
        deleted=deleted + 1
    else
        puts line
    end
end

puts "USUNIĘTO: #{deleted}"