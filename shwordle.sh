#!/bin/zsh

words=$(wc -l < words.txt)
randomLine=$((RANDOM%$words+1))
randomWord=$(sed "${randomLine}q;d" words.txt)

echo "Guess a word: "

read guess

function checkGuess {

  if [ ${#guess} -lt ${#randomWord} ]; then
      echo "Your guess is too short!"
  elif [ ${#guess} -gt ${#randomWord} ]; then
      echo "Your guess is too long!"
  fi

  output=""

  for (( i=0; i<${#randomWord}; i++ )); do
      if [ ${guess:$i:1} = ${randomWord:$i:1} ]; then
          output+="\e[32m${guess:$i:1}\e[0m"
      else
          output+="\e[31m${guess:$i:1}\e[0m"
      fi
  done

  echo $output

}


while [ $guess != $randomWord ]; do
  checkGuess
  read guess
done

echo "\e[32m${guess}\e[0m"
echo "You guessed it!"


