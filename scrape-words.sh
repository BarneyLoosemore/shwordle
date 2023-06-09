curl https://7esl.com/5-letter-words/ | sed -e 's/<[^>]*>//g' |  grep -Eo '\b\w{5}\b' | sort | uniq | grep -v '[0-9]' |  tr '[:upper:]' '[:lower:]' > words.txt
