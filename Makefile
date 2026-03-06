.PHONY: dev css css-watch serve install clean build

# Start Tailwind watch + Jekyll serve in parallel
dev:
	@echo "Starting dev server…"
	@trap 'kill 0' INT TERM; \
		npm run css:watch & \
		bundle exec jekyll serve --livereload & \
		wait

# One-shot Tailwind build
css:
	npm run css:build

# Tailwind in watch mode
css-watch:
	npm run css:watch

# Jekyll serve only
serve:
	bundle exec jekyll serve --livereload

# Install all dependencies
install:
	bundle install
	npm install

# Production build
build:
	npm run css:build
	bundle exec jekyll build

# Clean generated files
clean:
	rm -rf _site .jekyll-cache .sass-cache
