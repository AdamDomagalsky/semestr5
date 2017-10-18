iconv -f Latin2 -t UTF-8 slowa.lst > uslowa.lst

#1 Policzyc slowa z koncowka at
cat uslowa.lst | egrep 'at$' | wc -l

#2 Najczesniej wystepujaca koncówka 4 literowa
cat uslowa.lst | egrep -o '[[:alpha:]]{4}$' | sort | uniq -c | sort -rn | head -1 | awk '{print $2}'

#3 Palindormy LOL

#4 trigramy bashowe LOL

#5 2 slowa te same obok siebie 
# std: https://stackoverflow.com/questions/37322516/linux-ubuntu-awk-find-the-sentences-containg-2-same-words-placed-near-themselve

cat uslowa.lst | grep -Pzo '[^.?!]*\b(\w+) \1[^.?!]*' | wc -l

#6 ls -l tylko size i nazwa
ls -l | awk '{print "size:"$5,"\tname:",$9}'

#7 who jacy userzy na ilu sesjach
who | awk '{print $1}' | uniq -c

#8 who jacy userzy
who | awk '{print $1}' | uniq -c

#9 ls -l wyswietal ilosc podkatalogow
ls -l | egrep '^d' | wc -l

#10 lista freq słów
cat ukorpus.txt | tr '[:punct:]|[:space:]' '\n' | sort | uniq -c | sort -rn

#11 suma wielkosci plikow w cdr
ls -l | awk '{print $5}' | egrep -o '[0-9]+' | tr '\n' '+' | sed 's/.$//' | awk '{print}' | bc
ls -l | awk '{print $5}' | egrep -o '[0-9]+' | tr '\n' '+' | awk '{print substr($0,1,length($0)-1)}' | bc

#12

