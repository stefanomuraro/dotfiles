killport() {
    sudo lsof -t -i:"$1" | xargs sudo kill -9
}

cleanrepo() {
  gfa && gbg &&

  print -n "Do you want to delete all gone branches? (y/n): "
  read choice

  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    gbgD
  fi
}
