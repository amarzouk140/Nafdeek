#!/bin/bash

# Function to add Flutter to PATH
add_flutter_to_path() {
    FLUTTER_PATH="$HOME/flutter/bin"
    if [ -d "$FLUTTER_PATH" ]; then
        if [[ ":$PATH:" != *":$FLUTTER_PATH:"* ]]; then
            echo "Adding Flutter to PATH..."
            echo "export PATH=\"\$PATH:$FLUTTER_PATH\"" >> ~/.bash_profile
            source ~/.bash_profile
            echo "Flutter added to PATH successfully."
        else
            echo "Flutter is already in PATH."
        fi
    else
        echo "Flutter directory not found. Please ensure Flutter is installed correctly."
    fi
}

# Function to install Android Studio
install_android_studio() {
    if ! command -v android-studio &> /dev/null; then
        echo "Installing Android Studio..."
        # Add commands to install Android Studio here
    else
        echo "Android Studio is already installed."
    fi
}

# Function to install Xcode (for macOS users)
install_xcode() {
    if ! command -v xcode-select &> /dev/null; then
        echo "Xcode is not installed. Please install it from the Mac App Store or download it from https://developer.apple.com/xcode/."
        exit 1
    else
        echo "Xcode is already installed."
    fi
}

# Function to install Visual Studio Code
install_visual_studio_code() {
    if ! command -v code &> /dev/null; then
        echo "Installing Visual Studio Code..."
        # Add commands to install Visual Studio Code here
    else
        echo "Visual Studio Code is already installed."
    fi
}

# Function to create and run simulator using Xcode's command-line tools
create_and_run_simulator() {
    echo "Creating and running iOS simulator..."
    xcrun simctl create "MySimulator" "iPhone 11" # Change "iPhone 11" to the desired device type
    xcrun simctl boot "MySimulator"
    
    echo "Running the app on the simulator..."
    flutter emulators --launch apple_ios_simulator
    flutter run
}

# Install Flutter SDK
echo "Installing Flutter SDK..."
# Add commands to install Flutter SDK here

# Install Android Studio (optional, for macOS users)
install_android_studio

# Install Xcode (for macOS users)
install_xcode

# Install Visual Studio Code
install_visual_studio_code

# Add Flutter to PATH
add_flutter_to_path

# Clone the repository
# echo "Cloning the repository..."
# git clone https://github.com/your-username/your-repository.git

# # Navigate to the project directory
# cd your-project-directory

# Install dependencies
echo "Installing dependencies..."
flutter pub get

# Create and run simulator
create_and_run_simulator

# Provide instructions for running the app
echo "Setup completed! Follow the instructions in the README to run the app."
