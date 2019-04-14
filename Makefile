SHELL = /bin/bash

clean:
	rm -rf public

restore_theme:
	git submodule update --recursive

build: clean restore_theme
	hugo --config config.toml,config.prod.toml

start: restore_theme
	hugo --config config.toml,config.dev.toml server
