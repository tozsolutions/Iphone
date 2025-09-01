const express = require('express');
const helmet = require('helmet');
const compression = require('compression');
const cors = require('cors');
const morgan = require('morgan');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Security middleware
app.use(helmet({
    contentSecurityPolicy: {
        directives: {
            defaultSrc: ['\'self\''],
            styleSrc: ['\'self\'', '\'unsafe-inline\''],
            scriptSrc: ['\'self\''],
            imgSrc: ['\'self\'', 'data:', 'https:'],
            connectSrc: ['\'self\''],
            fontSrc: ['\'self\''],
            objectSrc: ['\'none\''],
            mediaSrc: ['\'self\''],
            frameSrc: ['\'none\'']
        }
    },
    crossOriginEmbedderPolicy: false
}));

// Compression middleware for better performance
app.use(compression());

// CORS middleware
app.use(cors({
    origin: process.env.NODE_ENV === 'production' ? 'your-domain.com' : true,
    credentials: true
}));

// Logging middleware
app.use(morgan(process.env.NODE_ENV === 'production' ? 'combined' : 'dev'));

// Parse JSON bodies
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true, limit: '10mb' }));

// Static files
app.use(express.static(path.join(__dirname, 'public')));

// Health check endpoint
app.get('/health', (req, res) => {
    res.status(200).json({
        status: 'OK',
        timestamp: new Date().toISOString(),
        uptime: process.uptime(),
        environment: process.env.NODE_ENV || 'development'
    });
});

// API routes
app.get('/api/info', (req, res) => {
    res.json({
        name: 'iPhone App',
        version: '1.0.0',
        description: 'A modern, responsive web application optimized for iPhone devices',
        features: [
            'Mobile-first responsive design',
            'Progressive Web App capabilities',
            'Production-ready security',
            'Performance optimized'
        ]
    });
});

// Serve main application
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// 404 handler
app.use('*', (req, res) => {
    res.status(404).json({
        error: 'Not Found',
        message: 'The requested resource was not found on this server.',
        status: 404
    });
});

// Error handling middleware
app.use((err, req, res, _next) => {
    console.error(err.stack);

    const statusCode = err.statusCode || 500;
    const message = process.env.NODE_ENV === 'production'
        ? 'Something went wrong!'
        : err.message;

    res.status(statusCode).json({
        error: 'Internal Server Error',
        message: message,
        status: statusCode,
        ...(process.env.NODE_ENV !== 'production' && { stack: err.stack })
    });
});

// Graceful shutdown
process.on('SIGTERM', () => {
    console.log('SIGTERM received, shutting down gracefully');
    process.exit(0);
});

process.on('SIGINT', () => {
    console.log('SIGINT received, shutting down gracefully');
    process.exit(0);
});

app.listen(PORT, () => {
    console.log(`🚀 iPhone App server running on port ${PORT}`);
    console.log(`📱 Environment: ${process.env.NODE_ENV || 'development'}`);
    console.log(`🔗 Health check: http://localhost:${PORT}/health`);
});

module.exports = app;
