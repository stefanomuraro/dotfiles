killport() {
    sudo lsof -t -i:"$1" | xargs sudo kill -9
}

cleanrepo() {
  gfa

  gone_branches=$(gbg)

  if [[ -z "$gone_branches" ]]; then
    echo "No branches to delete"
    return
  fi

  echo "$gone_branches"
  print -n "Do you want to delete all gone branches? (y/n): "
  read choice

  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    gbgD
  fi
}

