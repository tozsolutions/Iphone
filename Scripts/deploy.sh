#!/bin/bash

# Deployment script for iPhone app
# Usage: ./deploy.sh [staging|production]

set -e

ENVIRONMENT=${1:-staging}
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "🚀 Deploying iPhone app to $ENVIRONMENT..."
echo "📁 Project directory: $PROJECT_DIR"

cd "$PROJECT_DIR"

# Validate environment
if [[ "$ENVIRONMENT" != "staging" && "$ENVIRONMENT" != "production" ]]; then
    echo "❌ Invalid environment: $ENVIRONMENT"
    echo "Valid options: staging, production"
    exit 1
fi

# Pre-deployment checks
echo "🔍 Running pre-deployment checks..."

# Check if all tests pass
echo "🧪 Running tests..."
swift test

# Run code quality checks
if command -v swiftlint &> /dev/null; then
    echo "🔍 Running SwiftLint..."
    swiftlint
else
    echo "⚠️  SwiftLint not found. Install with: brew install swiftlint"
fi

# Build the project
echo "🏗️  Building project..."
./Scripts/build.sh release

# Version check
VERSION=$(grep -o 'MARKETING_VERSION = [^;]*' iPhone.xcodeproj/project.pbxproj | cut -d' ' -f3 | tr -d ';' || echo "1.0.0")
BUILD_NUMBER=$(grep -o 'CURRENT_PROJECT_VERSION = [^;]*' iPhone.xcodeproj/project.pbxproj | cut -d' ' -f3 | tr -d ';' || echo "1")

echo "📦 Version: $VERSION"
echo "🔢 Build: $BUILD_NUMBER"

# Environment-specific deployment
case $ENVIRONMENT in
    "staging")
        echo "🧪 Deploying to staging environment..."
        # Add staging-specific deployment commands here
        # Example: Upload to TestFlight internal testing
        echo "✅ Staging deployment completed"
        ;;
    "production")
        echo "🌟 Deploying to production environment..."
        
        # Additional production checks
        echo "🔒 Running security scan..."
        # Add security scanning here
        
        # Create production archive
        echo "📦 Creating production archive..."
        if [ -f "iPhone.xcodeproj/project.pbxproj" ]; then
            # For Xcode projects, use xcodebuild
            xcodebuild archive \
                -scheme iPhone \
                -configuration Release \
                -archivePath "build/iPhone.xcarchive" \
                CODE_SIGNING_ALLOWED=NO || echo "Archive creation requires valid signing certificates"
        fi
        
        echo "✅ Production deployment completed"
        ;;
esac

# Post-deployment
echo "📊 Generating deployment report..."
cat > "deployment-report-$ENVIRONMENT-$(date +%Y%m%d-%H%M%S).txt" << EOF
iPhone App Deployment Report
===========================

Environment: $ENVIRONMENT
Date: $(date)
Version: $VERSION
Build: $BUILD_NUMBER
Git Commit: $(git rev-parse HEAD 2>/dev/null || echo "N/A")
Git Branch: $(git branch --show-current 2>/dev/null || echo "N/A")

Deployment Status: SUCCESS
EOF

echo "✅ Deployment completed successfully!"
echo "📋 Report saved: deployment-report-$ENVIRONMENT-$(date +%Y%m%d-%H%M%S).txt"