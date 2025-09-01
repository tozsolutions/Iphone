module.exports = {
    'env': {
        'browser': true,
        'es2021': true,
        'node': true,
        'serviceworker': true,
        'jest': true
    },
    'extends': [
        'eslint:recommended'
    ],
    'parserOptions': {
        'ecmaVersion': 'latest',
        'sourceType': 'module'
    },
    'rules': {
        'indent': ['error', 4],
        'linebreak-style': ['error', 'unix'],
        'quotes': ['error', 'single'],
        'semi': ['error', 'always'],
        'no-unused-vars': ['error', { 'argsIgnorePattern': '^_' }],
        'no-console': ['warn', { 'allow': ['warn', 'error', 'log'] }],
        'prefer-const': 'error',
        'no-var': 'error',
        'arrow-spacing': 'error',
        'comma-dangle': ['error', 'never'],
        'eol-last': 'error',
        'no-multiple-empty-lines': ['error', { 'max': 2 }],
        'object-curly-spacing': ['error', 'always'],
        'space-before-function-paren': ['error', 'never'],
        'keyword-spacing': 'error',
        'space-infix-ops': 'error',
        'no-trailing-spaces': 'error'
    },
    'globals': {
        'gtag': 'readonly',
        'PerformanceObserver': 'readonly'
    }
};