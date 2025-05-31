# The What Tacoma? App

This is the repo for the "What Taco?" app. A Tacoma identification app.

## How The Repo is Structured

This repository contains a Flutter app named "What Taco?" that helps with Tacoma identification. The project is set up as a Flutter application with Rust integration via flutter_rust_bridge.

**Key Components:**

Flutter Frontend: The main mobile application built with Flutter SDK version ^3.7.2

Rust Backend: The app uses Rust for backend functionality.

Flutter-Rust Bridge: The project uses flutter_rust_bridge (version 2.10.0) to connect the Flutter frontend with the Rust backend

**Project Structure:**

Flutter Configuration:

- Standard Flutter setup with material design enabled
    
Rust Integration:

- Rust code in the rust/src/ directory
    
- Configuration in flutter_rust_bridge.yaml
        
Android Configuration: 

- Uses Gradle with Kotlin support
