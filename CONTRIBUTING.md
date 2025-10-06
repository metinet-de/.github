# Contributing to metinet-de Projects

Thank you for your interest in contributing! 🎉

We welcome contributions from the community, whether it's:

- 🐛 Bug reports
- 💡 Feature requests
- 📝 Documentation improvements
- 🔧 Code contributions
- 🎨 Design improvements

---

## 📋 How to Contribute

### 1. Reporting Bugs

**Before submitting:**
- Check if the bug has already been reported
- Test with the latest version
- Gather relevant information (OS, browser version, etc.)

**Create an issue with:**
- Clear, descriptive title
- Steps to reproduce
- Expected vs. actual behavior
- Screenshots/logs (if applicable)
- Environment details

### 2. Suggesting Features

**Feature requests should include:**
- Clear description of the feature
- Use case / problem it solves
- Potential implementation approach (if you have ideas)
- Alternative solutions you've considered

### 3. Code Contributions

#### First Time?

1. **Fork** the repository
2. **Clone** your fork locally
3. **Create a branch** for your changes
4. **Make your changes**
5. **Test** thoroughly
6. **Commit** with clear messages
7. **Push** to your fork
8. **Open a Pull Request**

#### Branch Naming

Use descriptive branch names:
```
feature/add-dark-mode
fix/api-timeout-issue
docs/update-readme
refactor/cleanup-content-js
```

#### Commit Messages

Follow conventional commits:
```
feat: add dark mode support
fix: resolve API timeout issues
docs: update installation guide
refactor: simplify form context extraction
test: add tests for sanitization
```

#### Pull Request Guidelines

- ✅ One feature/fix per PR
- ✅ Clear description of changes
- ✅ Reference related issues
- ✅ Include tests (if applicable)
- ✅ Update documentation
- ✅ Follow existing code style

---

## 💻 Development Setup

### Prerequisites

Each project may have different requirements. Check the project's README for:
- Required software versions
- Dependencies
- Build tools

### General Workflow

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/PROJECT_NAME.git
cd PROJECT_NAME

# Add upstream remote
git remote add upstream https://github.com/metinet-de/PROJECT_NAME.git

# Create a branch
git checkout -b feature/your-feature-name

# Make changes, test, commit
git add .
git commit -m "feat: your descriptive message"

# Push to your fork
git push origin feature/your-feature-name

# Open PR on GitHub
```

---

## 🎨 Code Style

### JavaScript

- Use ES6+ syntax
- 2-space indentation
- Single quotes for strings
- Semicolons required
- Descriptive variable names
- JSDoc comments for functions

### Example

```javascript
/**
 * Sanitizes user input to prevent XSS attacks
 * @param {string} input - The input string to sanitize
 * @returns {string} Sanitized string
 */
function sanitizeInput(input) {
  if (!input || typeof input !== 'string') {
    return '';
  }
  
  return input
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .trim();
}
```

### HTML

- Semantic HTML5
- Proper indentation
- Accessibility attributes
- No inline styles (use external CSS)

### CSS

- Mobile-first approach
- Use CSS variables for colors/spacing
- BEM naming convention (optional)
- Comments for complex sections

---

## ✅ Testing

- Write tests for new features
- Ensure existing tests pass
- Test in multiple browsers (if web-based)
- Test edge cases
- Manual testing for UI changes

---

## 📝 Documentation

Update documentation when:
- Adding new features
- Changing existing behavior
- Fixing bugs (if it affects usage)
- Updating APIs or configuration

Include:
- README updates
- Code comments
- API documentation
- Examples

---

## 🚫 What NOT to Do

- ❌ Submit PRs with unrelated changes
- ❌ Include personal/sensitive information
- ❌ Copy code without proper attribution
- ❌ Ignore code review feedback
- ❌ Force push after PR review starts

---

## 🤝 Code of Conduct

### Our Standards

- ✅ Be respectful and inclusive
- ✅ Welcome newcomers
- ✅ Accept constructive criticism
- ✅ Focus on what's best for the project
- ✅ Show empathy

### Unacceptable Behavior

- ❌ Harassment or discrimination
- ❌ Trolling or insulting comments
- ❌ Personal or political attacks
- ❌ Publishing others' private information
- ❌ Unprofessional conduct

---

## 📞 Questions?

- 💬 Open a [Discussion](https://github.com/orgs/metinet-de/discussions) (if enabled)
- 📧 Email: [info@metinet.de](mailto:info@metinet.de)
- 🐛 GitHub Issues (for bug reports only)

---

## 📄 License

By contributing, you agree that your contributions will be licensed under the same license as the project.

---

## 🙏 Thank You!

Your contributions make these projects better for everyone. We appreciate your time and effort!

---

<p align="center">
  <sub>Happy Coding! 💻</sub>
</p>
