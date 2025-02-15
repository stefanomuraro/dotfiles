killport() {
    sudo lsof -t -i:"$1" | xargs sudo kill -9
}
