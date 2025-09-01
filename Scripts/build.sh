#!/bin/bash

# Build script for iPhone app
# Usage: ./build.sh [debug|release]

set -e

BUILD_TYPE=${1:-debug}
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "🏗️  Building iPhone app..."
echo "📁 Project directory: $PROJECT_DIR"
echo "🔧 Build type: $BUILD_TYPE"

cd "$PROJECT_DIR"

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf .build
rm -rf build

# Build with Swift Package Manager
echo "📦 Building with Swift Package Manager..."
if [ "$BUILD_TYPE" = "release" ]; then
    swift build -c release
else
    swift build -c debug
fi

# Run SwiftLint if available
if command -v swiftlint &> /dev/null; then
    echo "🔍 Running SwiftLint..."
    swiftlint
else
    echo "⚠️  SwiftLint not found. Install with: brew install swiftlint"
fi

echo "✅ Build completed successfully!"

# Archive for release builds
if [ "$BUILD_TYPE" = "release" ]; then
    echo "📦 Creating archive..."
    mkdir -p build/release
    cp -r .build/release/* build/release/ 2>/dev/null || true
    echo "✅ Archive created in build/release/"
fi