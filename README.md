# metinet.de Organization & Website

This repository serves dual purposes:
1. **Organization-wide files** for the metinet.de GitHub organization
2. **Jekyll-powered website** hosted at https://metinet.de

## 🌐 Website Features

### Main Website (`metinet.de`)
- Modern, responsive design
- Project showcase
- Professional contact information
- Privacy-first approach

### Blog (`metinet.de/blog/`)
- Jekyll-powered blog system
- Technical articles and insights
- AI/ML and software development topics
- RSS feed support

## 📋 Organization Files

### `/profile/README.md`
- Organization profile displayed at: https://github.com/metinet.de
- Contains overview, projects, contact information

### `SECURITY.md`
- Security policy for all repositories
- How to report vulnerabilities
- Applied to all projects in the organization

### `CONTRIBUTING.md`
- Contribution guidelines
- Code of conduct
- Development workflow
- Applied to all projects in the organization

## 🚀 Website Structure

```
├── index.html              # Main homepage
├── blog/                   # Blog section
│   └── index.md           # Blog overview
├── _posts/                # Blog posts
├── _layouts/              # Jekyll templates
├── _includes/             # Reusable components
├── assets/css/            # Stylesheets
├── _config.yml            # Jekyll configuration
├── CNAME                  # Custom domain config
└── Gemfile                # Ruby dependencies
```

## 🔧 How It Works

### Organization Features
GitHub automatically uses files from this `.github` repository across the entire organization:

- **Profile README** → Shown on organization homepage
- **SECURITY.md** → Default security policy for all repos (unless overridden)
- **CONTRIBUTING.md** → Default contribution guide for all repos (unless overridden)

### Website Features
- **Jekyll Integration** → Static site generation
- **GitHub Pages** → Automatic deployment
- **Custom Domain** → metinet.de via CNAME record
- **Blog System** → Markdown-based posts with categories/tags

## 📝 Making Changes

### Website Updates
1. **Blog Posts**: Add new `.md` files to `_posts/` with format: `YYYY-MM-DD-title.md`
2. **Styling**: Modify `assets/css/style.scss`
3. **Layout**: Edit files in `_layouts/` and `_includes/`
4. **Configuration**: Update `_config.yml`

### Organization Updates
1. Clone this repository
2. Make changes to the relevant files
3. Commit and push
4. Changes apply automatically across the organization

## 🛠️ Development

### Local Development
```bash
# Clone repository
git clone https://github.com/metinet-de/.github.git
cd .github

# Install Ruby via rbenv (macOS)
brew install rbenv ruby-build
echo 'export RBENV_ROOT="$HOME/.rbenv"' >> ~/.zshrc
echo 'export PATH="$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
exec zsh
rbenv install -s 3.1.6
rbenv global 3.1.6

# Install dependencies
bundle install
npm install

# Build CSS
npm run css:build

# Build site once
bundle exec jekyll build

# Serve locally
bundle exec jekyll serve

# Visit: http://localhost:4000
```

> Note: GitHub Pages/Jekyll dependencies in this project currently run reliably with Ruby 3.1.6 for local builds.

### Domain Configuration
See [DOMAIN_SETUP.md](DOMAIN_SETUP.md) for detailed instructions on configuring the custom domain.

---

## 📞 Contact

**Website:** https://metinet.de  
**Email:** info@metinet.de  
**Organization:** https://github.com/metinet.de  
**Blog:** https://metinet.de/blog/

---

**Maintained by:** Metin Özkan  
**Location:** Berlin, Germany
