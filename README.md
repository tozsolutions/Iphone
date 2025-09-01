# 📱 iPhone App - Production-Ready Mobile Web Application

A modern, responsive web application specifically optimized for iPhone devices, built with production-ready features, security, and performance in mind.

![iPhone App](https://img.shields.io/badge/iPhone-Optimized-007AFF?style=for-the-badge&logo=apple)
![Node.js](https://img.shields.io/badge/Node.js-18+-339933?style=for-the-badge&logo=node.js)
![License](https://img.shields.io/badge/License-Apache%202.0-blue?style=for-the-badge)
![PWA](https://img.shields.io/badge/PWA-Ready-5A0FC8?style=for-the-badge)

## ✨ Features

### 📱 Mobile-First Design
- **iPhone Optimized**: Specifically designed for iPhone screens and interactions
- **Responsive Layout**: Adapts perfectly to all iPhone models and orientations
- **Touch Gestures**: Natural swipe navigation and touch interactions
- **PWA Ready**: Progressive Web App with offline capabilities

### 🚀 Performance & Security
- **Production Ready**: Built with enterprise-grade security and performance
- **Service Worker**: Offline support and background sync capabilities
- **Security Headers**: Comprehensive security configuration with Helmet.js
- **Performance Monitoring**: Built-in Core Web Vitals tracking

### 🛠️ Developer Experience
- **Modern Stack**: Node.js, Express.js, ES6+, PWA technologies
- **CI/CD Pipeline**: GitHub Actions with automated testing and deployment
- **Docker Support**: Containerized deployment with multi-stage builds
- **Code Quality**: ESLint, Prettier, Jest testing framework

## 🏗️ Architecture

```
iPhone App/
├── src/
│   ├── public/           # Static files (HTML, CSS, JS, PWA assets)
│   │   ├── css/         # Stylesheets
│   │   ├── js/          # Client-side JavaScript
│   │   ├── icons/       # PWA icons and favicons
│   │   ├── images/      # Static images
│   │   ├── manifest.json # PWA manifest
│   │   ├── sw.js        # Service Worker
│   │   └── index.html   # Main HTML file
│   ├── config/          # Configuration files
│   ├── middleware/      # Express middleware
│   ├── routes/          # API routes
│   ├── utils/           # Utility functions
│   ├── tests/           # Test files
│   └── server.js        # Main server file
├── .github/workflows/   # CI/CD pipelines
├── Docker files        # Container configuration
└── Configuration files # ESLint, Prettier, Jest, etc.
```

## 🚀 Quick Start

### Prerequisites
- Node.js 16+ and npm 8+
- Docker (optional, for containerized deployment)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/tozsolutions/Iphone.git
   cd Iphone
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Configure environment**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. **Start development server**
   ```bash
   npm run dev
   ```

5. **Open in browser**
   ```
   http://localhost:3000
   ```

### 📱 Testing on iPhone

For best experience, test on actual iPhone devices:

1. **Network Testing**: Connect iPhone to same network as development machine
2. **Access via IP**: `http://[your-local-ip]:3000`
3. **Add to Home Screen**: Use Safari's "Add to Home Screen" feature
4. **PWA Testing**: Test offline functionality and app-like behavior

## 🧪 Testing

### Run Tests
```bash
npm test                 # Run all tests
npm run test:watch      # Watch mode for development
```

### Code Quality
```bash
npm run lint            # ESLint checking
npm run lint:fix        # Auto-fix linting issues
npm run format          # Format code with Prettier
```

### Build Verification
```bash
npm run build           # Production build check
```

## 🐳 Docker Deployment

### Build Docker Image
```bash
docker build -t iphone-app .
```

### Run Container
```bash
docker run -p 3000:3000 iphone-app
```

### Production Deployment
```bash
npm run docker:build
npm run docker:run
```

## 🔧 Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Server port | `3000` |
| `NODE_ENV` | Environment | `development` |
| `CORS_ORIGIN` | CORS origin | `*` |
| `LOG_LEVEL` | Logging level | `info` |

See `.env.example` for complete configuration options.

### PWA Configuration

Edit `src/public/manifest.json` to customize:
- App name and description
- Theme colors
- Icons and splash screens
- Display mode and orientation

## 🚀 Deployment

### GitHub Actions CI/CD

The repository includes a comprehensive CI/CD pipeline:

1. **Code Quality**: ESLint, Prettier, security audits
2. **Testing**: Unit tests, integration tests, coverage reports
3. **Building**: Docker image creation and vulnerability scanning
4. **Performance**: Lighthouse audits and Core Web Vitals
5. **Deployment**: Automated staging and production deployment

### Production Checklist

- [ ] Configure production environment variables
- [ ] Set up SSL/HTTPS certificates
- [ ] Configure CDN for static assets
- [ ] Set up monitoring and logging
- [ ] Configure backup and disaster recovery
- [ ] Implement rate limiting and DDoS protection
- [ ] Set up database (if required)
- [ ] Configure caching strategy

## 📊 Performance

### Core Web Vitals
- **LCP (Largest Contentful Paint)**: < 2.5s
- **FID (First Input Delay)**: < 100ms
- **CLS (Cumulative Layout Shift)**: < 0.1

### iPhone Optimizations
- Touch targets minimum 44px
- Optimized for iOS Safari
- Reduced motion support
- Dark mode compatibility
- Retina display optimization

## 🔒 Security

### Security Features
- **Helmet.js**: Security headers and CSP
- **CORS**: Configurable cross-origin resource sharing
- **Rate Limiting**: Built-in request rate limiting
- **Input Validation**: Request body validation
- **Error Handling**: Secure error responses

### Security Headers
- Content Security Policy (CSP)
- X-Frame-Options: DENY
- X-Content-Type-Options: nosniff
- X-XSS-Protection: 1; mode=block

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines
- Follow ESLint and Prettier configurations
- Write tests for new features
- Update documentation as needed
- Ensure mobile-first approach
- Test on actual iPhone devices

## 📝 API Documentation

### Health Check
```
GET /health
```
Returns server health status and uptime information.

### App Information
```
GET /api/info
```
Returns application metadata and features.

### Static Files
- `/`: Main application
- `/manifest.json`: PWA manifest
- `/sw.js`: Service Worker
- `/css/*`: Stylesheets
- `/js/*`: JavaScript files
- `/icons/*`: PWA icons

## 🐛 Troubleshooting

### Common Issues

**Service Worker not updating**
- Clear browser cache and storage
- Check browser developer tools for SW errors

**PWA not installing**
- Ensure HTTPS in production
- Verify manifest.json is valid
- Check all required PWA criteria

**Performance issues**
- Enable compression middleware
- Optimize images and assets
- Check network throttling settings

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with modern web technologies and best practices
- Optimized for iPhone user experience
- Production-ready with enterprise-grade security
- Community-driven development approach

---

**Made with ❤️ for iPhone users by [tozsolutions](https://github.com/tozsolutions)**

For support and inquiries: [Open an issue](https://github.com/tozsolutions/Iphone/issues)