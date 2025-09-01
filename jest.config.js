module.exports = {
    testEnvironment: 'node',
    testMatch: ['**/src/tests/**/*.test.js'],
    collectCoverage: true,
    coverageDirectory: 'coverage',
    coverageReporters: ['text', 'lcov', 'html'],
    collectCoverageFrom: [
        'src/**/*.js',
        '!src/tests/**',
        '!src/public/**'
    ],
    testTimeout: 10000,
    verbose: true,
    forceExit: true,
    clearMocks: true,
    restoreMocks: true
};