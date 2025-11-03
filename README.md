```sh
# Install dotfiles
"${DOTFILES}/scripts/create-symlinks.sh"

# Install dir
rsync -av "${DIR}/" "${LOCAL}/"
```
