#!/bin/bash

# iPhone App Deployment Script
# This script helps with common deployment tasks

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
APP_NAME="iphone-app"
DOCKER_IMAGE="$APP_NAME"
PORT=3000

# Helper functions
log() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Validate environment
validate_environment() {
    log "Validating environment..."
    
    if ! command_exists node; then
        error "Node.js is not installed. Please install Node.js 16+."
    fi
    
    if ! command_exists npm; then
        error "npm is not installed. Please install npm 8+."
    fi
    
    if ! command_exists git; then
        error "Git is not installed."
    fi
    
    # Check Node.js version
    NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_VERSION" -lt 16 ]; then
        error "Node.js version 16+ is required. Current version: $(node --version)"
    fi
    
    log "Environment validation passed ✓"
}

# Install dependencies
install_deps() {
    log "Installing dependencies..."
    npm ci
    log "Dependencies installed ✓"
}

# Run linting
lint_code() {
    log "Running code linting..."
    npm run lint
    log "Linting passed ✓"
}

# Run tests
run_tests() {
    log "Running tests..."
    npm test
    log "Tests passed ✓"
}

# Build for production
build_app() {
    log "Building application for production..."
    npm run build
    log "Build completed ✓"
}

# Docker operations
docker_build() {
    if ! command_exists docker; then
        error "Docker is not installed."
    fi
    
    log "Building Docker image..."
    docker build -t "$DOCKER_IMAGE" .
    log "Docker image built ✓"
}

docker_run() {
    if ! command_exists docker; then
        error "Docker is not installed."
    fi
    
    log "Running Docker container..."
    docker run -d -p "$PORT:$PORT" --name "$APP_NAME" "$DOCKER_IMAGE"
    log "Docker container started ✓"
    log "Application available at: http://localhost:$PORT"
}

docker_stop() {
    if docker ps -q -f name="$APP_NAME" | grep -q .; then
        log "Stopping Docker container..."
        docker stop "$APP_NAME"
        docker rm "$APP_NAME"
        log "Docker container stopped ✓"
    else
        warn "No running container found with name: $APP_NAME"
    fi
}

# Health check
health_check() {
    log "Performing health check..."
    
    # Wait for application to start
    sleep 5
    
    # Check health endpoint
    if curl -f -s "http://localhost:$PORT/health" > /dev/null; then
        log "Health check passed ✓"
        log "Application is running successfully!"
    else
        error "Health check failed. Application may not be running properly."
    fi
}

# Development setup
dev_setup() {
    log "Setting up development environment..."
    
    validate_environment
    install_deps
    
    # Create .env if it doesn't exist
    if [ ! -f .env ]; then
        log "Creating .env file from template..."
        cp .env.example .env
        warn "Please edit .env file with your configuration"
    fi
    
    lint_code
    run_tests
    
    log "Development setup completed ✓"
    log "Run 'npm run dev' to start the development server"
}

# Production deployment
production_deploy() {
    log "Deploying to production..."
    
    validate_environment
    install_deps
    lint_code
    run_tests
    build_app
    
    if command_exists docker; then
        docker_build
        docker_stop  # Stop existing container
        docker_run
        health_check
    else
        warn "Docker not available. Starting with npm..."
        NODE_ENV=production npm start &
        SERVER_PID=$!
        health_check
        kill $SERVER_PID
    fi
    
    log "Production deployment completed ✓"
}

# Cleanup
cleanup() {
    log "Performing cleanup..."
    
    # Remove node_modules
    if [ -d "node_modules" ]; then
        rm -rf node_modules
        log "Removed node_modules ✓"
    fi
    
    # Remove Docker containers and images
    if command_exists docker; then
        docker_stop
        if docker images -q "$DOCKER_IMAGE" | grep -q .; then
            docker rmi "$DOCKER_IMAGE"
            log "Removed Docker image ✓"
        fi
    fi
    
    log "Cleanup completed ✓"
}

# Show help
show_help() {
    echo -e "${BLUE}iPhone App Deployment Script${NC}"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  setup         Set up development environment"
    echo "  install       Install dependencies"
    echo "  lint          Run code linting"
    echo "  test          Run tests"
    echo "  build         Build for production"
    echo "  docker-build  Build Docker image"
    echo "  docker-run    Run Docker container"
    echo "  docker-stop   Stop Docker container"
    echo "  deploy        Full production deployment"
    echo "  health        Check application health"
    echo "  cleanup       Clean up files and containers"
    echo "  help          Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 setup       # Set up development environment"
    echo "  $0 deploy      # Deploy to production"
    echo "  $0 health      # Check if app is running"
    echo ""
}

# Main script logic
case "${1:-}" in
    "setup")
        dev_setup
        ;;
    "install")
        validate_environment
        install_deps
        ;;
    "lint")
        lint_code
        ;;
    "test")
        run_tests
        ;;
    "build")
        build_app
        ;;
    "docker-build")
        docker_build
        ;;
    "docker-run")
        docker_run
        ;;
    "docker-stop")
        docker_stop
        ;;
    "deploy")
        production_deploy
        ;;
    "health")
        health_check
        ;;
    "cleanup")
        cleanup
        ;;
    "help"|"--help"|"-h")
        show_help
        ;;
    "")
        show_help
        ;;
    *)
        error "Unknown command: $1. Run '$0 help' for usage information."
        ;;
esac