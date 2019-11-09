#rails c

function dcrc() {
  read -p "baseconnect or sales?  >>" name;
  docker exec -it ${name} bundle exec rails c;
}


