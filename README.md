# Mastertask-SwiftUI

A mobile iOS app project demonstrating task-based UI components, networking, and data handling in Swift. The repository includes the complete Xcode project source, test targets, and supporting utilities for the MasterTaskCode app.

## Project Overview

This workspace contains the `MasterTaskCode` iOS application, which is organized into:

- `MasterTaskCode/` - The main Xcode project source code.
- `MasterTaskCodeTests/` - Unit test target for verifying app logic.
- `MasterTaskCodeUITests/` - UI test target for validating user flows.

## Key Features

- App entry and lifecycle management via `AppDelegate.swift` and `SceneDelegate.swift`
- Task-driven UI examples grouped under `Tasks/`
- Networking and API management in `Services/`
- Data models for domain entities in `Models/`
- View models for business logic in `ViewModels/`
- UIKit-based views and view controllers in `Views/`
- Utility helpers and shared components in `Helpers/`

## Repository Structure

```
MasterTaskCode-SwiftUI/
  MasterTaskCode/          # Main app source files
    AppDelegate.swift
    SceneDelegate.swift
    Models/
    Services/
    ViewModels/
    Views/
    Helpers/
    Utilities/
  MasterTaskCode.xcodeproj/ # Xcode project files
  MasterTaskCodeTests/      # Unit tests
  MasterTaskCodeUITests/    # UI tests
```

## Getting Started

1. Open `MasterTaskCode.xcodeproj` in Xcode.
2. Select the `MasterTaskCode` target.
3. Build and run on a simulator or device running iOS.

## Requirements

- Xcode 12 or later
- iOS 13 or later

## Notes

- The project contains sample tasks and UI examples under `Tasks/`.
- Networking logic is centralized in `Services/` for reuse.
- The app uses Core Data model files in `MasterTaskCode.xcdatamodeld/`.

## Useful Files

- `MasterTaskCode/Helpers/AlertVC.swift` - alert presentation helper
- `MasterTaskCode/Services/NetworkManager.swift` - network requests
- `MasterTaskCode/ViewModels/SchoolViewModel.swift` - view model example
- `MasterTaskCode/Views/DetailsViewController.swift` - detail screen implementation

## License

This repository does not specify a license. Add a `LICENSE` file if you want to clarify reuse and distribution terms.

