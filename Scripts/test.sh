#!/bin/bash

# Test script for iPhone app
# Usage: ./test.sh [unit|ui|all]

set -e

TEST_TYPE=${1:-all}
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "🧪 Running tests for iPhone app..."
echo "📁 Project directory: $PROJECT_DIR"
echo "🎯 Test type: $TEST_TYPE"

cd "$PROJECT_DIR"

# Function to run unit tests
run_unit_tests() {
    echo "🧪 Running unit tests..."
    swift test --parallel
}

# Function to run UI tests (would require Xcode project)
run_ui_tests() {
    echo "🖥️  Running UI tests..."
    if [ -f "iPhone.xcodeproj/project.pbxproj" ]; then
        xcodebuild test -scheme iPhone -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'
    else
        echo "⚠️  UI tests require Xcode project. Skipping..."
    fi
}

# Function to generate test coverage
generate_coverage() {
    echo "📊 Generating test coverage..."
    swift test --enable-code-coverage
    
    if command -v xcov &> /dev/null; then
        xcov --scheme iPhone --output_directory coverage_reports
        echo "📊 Coverage report generated in coverage_reports/"
    else
        echo "⚠️  xcov not found. Install with: gem install xcov"
    fi
}

# Run tests based on type
case $TEST_TYPE in
    "unit")
        run_unit_tests
        ;;
    "ui")
        run_ui_tests
        ;;
    "all")
        run_unit_tests
        run_ui_tests
        ;;
    *)
        echo "❌ Invalid test type: $TEST_TYPE"
        echo "Valid options: unit, ui, all"
        exit 1
        ;;
esac

generate_coverage

echo "✅ Tests completed successfully!"