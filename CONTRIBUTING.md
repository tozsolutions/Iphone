# Contributing to iPhone App

Thank you for your interest in contributing to the iPhone App! This document provides guidelines and instructions for contributing to this project.

## 🚀 Getting Started

### Prerequisites

- Node.js 16+ and npm 8+
- Git
- Docker (optional, for testing containerized deployment)
- An iPhone or iPhone simulator for testing

### Development Setup

1. **Fork and clone the repository**
   ```bash
   git clone https://github.com/your-username/Iphone.git
   cd Iphone
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Create environment file**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. **Start development server**
   ```bash
   npm run dev
   ```

5. **Run tests**
   ```bash
   npm test
   npm run lint
   ```

## 📝 Development Guidelines

### Code Style

We use ESLint and Prettier for code formatting and linting:

- **ESLint**: Enforces code quality and consistency
- **Prettier**: Handles code formatting
- **Configuration**: See `.eslintrc.js` and `.prettierrc`

```bash
npm run lint          # Check linting
npm run lint:fix      # Auto-fix linting issues
npm run format        # Format code with Prettier
```

### Mobile-First Approach

This project is specifically optimized for iPhone devices:

- **Responsive Design**: Always design mobile-first, then enhance for larger screens
- **Touch Interactions**: Ensure all interactions work well with touch
- **Performance**: Optimize for mobile networks and device capabilities
- **Accessibility**: Follow iOS accessibility guidelines

### Testing Requirements

- **Unit Tests**: Write tests for all new functionality
- **Integration Tests**: Test API endpoints and core features
- **Mobile Testing**: Test on actual iPhone devices when possible
- **Performance Testing**: Ensure changes don't degrade performance

```bash
npm test              # Run all tests
npm run test:watch    # Watch mode for development
```

## 🔧 Project Structure

```
src/
├── public/           # Static assets
│   ├── css/         # Stylesheets
│   ├── js/          # Client-side JavaScript
│   ├── icons/       # PWA icons
│   └── manifest.json # PWA manifest
├── config/          # Configuration files
├── middleware/      # Express middleware
├── routes/          # API routes
├── utils/           # Utility functions
├── tests/           # Test files
└── server.js        # Main server file
```

## 📱 iPhone Optimization Guidelines

### CSS Guidelines

- Use `-webkit-` prefixes for iOS Safari compatibility
- Implement proper touch target sizes (minimum 44px)
- Use safe area insets for iPhone X and newer models
- Support both light and dark modes

### JavaScript Guidelines

- Use modern ES6+ features
- Implement proper touch event handling
- Add PWA features (service worker, offline support)
- Handle iOS-specific behaviors (viewport, scrolling)

### Performance Guidelines

- Optimize images for Retina displays
- Minimize JavaScript bundle size
- Use proper caching strategies
- Implement lazy loading where appropriate

## 🚦 Contribution Process

### 1. Create an Issue

Before making changes, create an issue to discuss:
- Bug reports with reproduction steps
- Feature requests with detailed descriptions
- Performance improvements with benchmarks

### 2. Branch Naming

Use descriptive branch names:
- `feature/add-touch-gestures`
- `bugfix/fix-safari-scrolling`
- `improvement/optimize-images`

### 3. Commit Messages

Follow conventional commit format:
```
type(scope): description

feat(navigation): add swipe gesture support
fix(css): resolve iPhone X safe area issues
docs(readme): update installation instructions
```

### 4. Pull Request Process

1. **Fork** the repository
2. **Create** a feature branch
3. **Make** your changes with tests
4. **Ensure** all tests pass
5. **Submit** a pull request

#### Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Performance improvement
- [ ] Documentation update

## iPhone Testing
- [ ] Tested on iPhone Safari
- [ ] Verified touch interactions
- [ ] Checked responsive layout
- [ ] Tested PWA functionality

## Checklist
- [ ] Tests pass
- [ ] Code follows style guidelines
- [ ] Documentation updated
- [ ] Mobile optimization verified
```

## 🧪 Testing Guidelines

### Unit Testing

- Test individual functions and components
- Mock external dependencies
- Achieve good test coverage (>80%)

### Integration Testing

- Test API endpoints
- Verify database interactions
- Test middleware functionality

### Mobile Testing

- Test on multiple iPhone models
- Verify touch interactions
- Check performance on mobile networks
- Test PWA installation and offline functionality

### Performance Testing

- Use Lighthouse for performance audits
- Monitor Core Web Vitals
- Test loading times on slow networks

## 📋 Review Process

### Code Review Checklist

- [ ] Code follows project conventions
- [ ] Changes are well-tested
- [ ] Documentation is updated
- [ ] Mobile optimization is maintained
- [ ] No breaking changes without discussion
- [ ] Security considerations addressed

### Mobile Review Criteria

- [ ] Responsive design works on iPhone
- [ ] Touch targets are appropriately sized
- [ ] Performance is not degraded
- [ ] PWA functionality is maintained
- [ ] iOS Safari compatibility verified

## 🐛 Bug Reports

When reporting bugs, include:

1. **Device Information**
   - iPhone model
   - iOS version
   - Safari version

2. **Steps to Reproduce**
   - Clear, numbered steps
   - Expected vs actual behavior
   - Screenshots if applicable

3. **Environment**
   - App version
   - Network conditions
   - Any console errors

## 💡 Feature Requests

For new features, provide:

1. **Use Case**: Why is this needed?
2. **iPhone Relevance**: How does it benefit iPhone users?
3. **Implementation Ideas**: Suggested approach
4. **Compatibility**: iOS Safari considerations

## 📚 Resources

### iPhone Development
- [iOS Safari Web Content Guide](https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariWebContent/)
- [PWA Guidelines for iOS](https://developer.apple.com/documentation/webkit/safari_web_extensions)
- [iPhone Design Guidelines](https://developer.apple.com/design/human-interface-guidelines/)

### Web Standards
- [MDN Web Docs](https://developer.mozilla.org/)
- [Web Content Accessibility Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Progressive Web App Checklist](https://web.dev/pwa-checklist/)

## 🤝 Community

- **Discussions**: Use GitHub Discussions for questions
- **Issues**: Report bugs and request features
- **Pull Requests**: Contribute code improvements

## 📄 License

By contributing to this project, you agree that your contributions will be licensed under the Apache License 2.0.

---

Thank you for helping make the iPhone App better! 🚀📱