.PHONY: dev css css-watch serve install clean build test check-dev-env

RBENV := $(shell command -v rbenv 2>/dev/null)
RUBY_VERSION := $(strip $(shell cat .ruby-version 2>/dev/null))

ifdef RBENV
BUNDLE := RBENV_VERSION=$(RUBY_VERSION) $(RBENV) exec bundle
else
BUNDLE := bundle
endif

JEKYLL := $(BUNDLE) exec jekyll

check-dev-env:
	@command -v npm >/dev/null 2>&1 || { echo "npm is not installed or not on PATH."; exit 1; }
	@$(BUNDLE) -v >/dev/null 2>&1 || { \
		echo "Bundler for Ruby $(RUBY_VERSION) is not available."; \
		if [ -n "$(RBENV)" ] && [ -n "$(RUBY_VERSION)" ]; then \
			echo "Run: RBENV_VERSION=$(RUBY_VERSION) rbenv exec bundle install"; \
		else \
			echo "Run: bundle install"; \
		fi; \
		exit 1; \
	}

# Start Tailwind watch + Jekyll serve in parallel
dev: check-dev-env
	@echo "Starting dev server…"
	@trap 'kill 0' INT TERM; \
		npm run css:watch & \
		$(JEKYLL) serve --livereload & \
		wait

# One-shot Tailwind build
css:
	npm run css:build

# Tailwind in watch mode
css-watch:
	npm run css:watch

# Jekyll serve only
serve: check-dev-env
	$(JEKYLL) serve --livereload

# Install all dependencies
install:
	$(BUNDLE) install
	npm install

# Production build (clean first)
build:
	rm -rf _site .jekyll-cache
	npm run css:build
	$(JEKYLL) build

# Clean generated files
clean:
	rm -rf _site .jekyll-cache .sass-cache

# Run build verification tests (builds first if needed)
test: build
	./scripts/build-verify.sh
