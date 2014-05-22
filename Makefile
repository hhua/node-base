usage:
	@echo ''
	@echo 'Core tasks                                       : Description'
	@echo '--------------                                   : -----------'
	@echo 'make setup                                       : Install all necessary dependencies'
	@echo 'make dev                                         : Start the local development server'
	@echo 'make grunt                                       : Run grunt tasks'
	@echo ''
	@echo 'Additional tasks                                 : Description'
	@echo '--------------                                   : -----------'
	@echo 'make clean                                       : Clean up any *.tmp files from bad NPM installs, old packages'
	@echo 'make reset                                       : Reinstall all necessary dependencies'
	@echo ''

NPM_ARGS = --registry http://registry.npmjs.org
setup:
	npm $(NPM_ARGS) install

.PHONY: setup

clean:
	rm -rf *.tmp *.tar.gz
	grunt clean
	rm -rf node_modules

.PHONY: clean

grunt:
	grunt

.PHONY: grunt

dev:
	node ./dest/app.js

.PHONY: dev

reset:
	npm cache clean
	$(MAKE) clean setup

.PHONY: reset