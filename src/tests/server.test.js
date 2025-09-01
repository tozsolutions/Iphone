const request = require('supertest');
const app = require('../server');

describe('iPhone App Server', () => {
    describe('Health Check', () => {
        it('should return 200 and health status', async() => {
            const response = await request(app)
                .get('/health')
                .expect(200);

            expect(response.body).toHaveProperty('status', 'OK');
            expect(response.body).toHaveProperty('timestamp');
            expect(response.body).toHaveProperty('uptime');
            expect(response.body).toHaveProperty('environment');
        });
    });

    describe('API Info', () => {
        it('should return app information', async() => {
            const response = await request(app)
                .get('/api/info')
                .expect(200);

            expect(response.body).toHaveProperty('name', 'iPhone App');
            expect(response.body).toHaveProperty('version', '1.0.0');
            expect(response.body).toHaveProperty('description');
            expect(response.body).toHaveProperty('features');
            expect(Array.isArray(response.body.features)).toBe(true);
        });
    });

    describe('Static Files', () => {
        it('should serve index.html', async() => {
            const response = await request(app)
                .get('/')
                .expect(200);

            expect(response.type).toBe('text/html');
        });

        it('should serve manifest.json', async() => {
            const response = await request(app)
                .get('/manifest.json')
                .expect(200);

            expect(response.type).toBe('application/json');
        });

        it('should serve service worker', async() => {
            const response = await request(app)
                .get('/sw.js')
                .expect(200);

            expect(response.type).toBe('application/javascript');
        });
    });

    describe('Error Handling', () => {
        it('should return 404 for non-existent routes', async() => {
            const response = await request(app)
                .get('/non-existent-route')
                .expect(404);

            expect(response.body).toHaveProperty('error', 'Not Found');
            expect(response.body).toHaveProperty('status', 404);
        });
    });

    describe('Security Headers', () => {
        it('should include security headers', async() => {
            const response = await request(app)
                .get('/health')
                .expect(200);

            expect(response.headers).toHaveProperty('x-content-type-options');
            expect(response.headers).toHaveProperty('x-frame-options');
            expect(response.headers).toHaveProperty('x-xss-protection');
        });
    });
});
