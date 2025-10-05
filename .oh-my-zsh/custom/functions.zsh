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
  read -r -p "Do you want to delete all gone branches? [Y/n]: " choice

  choice=${choice:-Y}

  if [[ "$choice" == [Yy] ]]; then
    gbgD
  fi
}


