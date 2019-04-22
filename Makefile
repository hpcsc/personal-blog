SHELL = /bin/bash

clean:
	rm -rf public

install_hugo:
	curl -L https://github.com/gohugoio/hugo/releases/download/v0.55.1/hugo_0.55.1_Linux-64bit.tar.gz -o hugo.tar.gz
	tar xvzf hugo.tar.gz
	rm -f hugo.tar.gz
	chmod +x ./hugo && sudo mv hugo /usr/local/bin

restore_theme:
	git submodule update --recursive

update_theme:
	git submodule update --remote

build: clean restore_theme
	hugo --config config.toml,config.prod.toml

start:
	hugo --config config.toml,config.dev.toml server
