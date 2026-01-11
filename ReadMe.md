#  LFPlatformKit

**LFPlatformKit** is a lightweight platform-oriented framework that provides
high-level utilities for interacting with the Apple system environment.

It contains abstractions that depend on **UIKit / App lifecycle / platform APIs**,
while keeping core logic and concurrency layers clean and platform-agnostic.

---

## Overview

LFPlatformKit is designed to host utilities that:

- interact with the operating system
- rely on UIKit or platform-specific APIs
- must run on the Main Actor
- should not live inside core or concurrency frameworks

Typical use cases include:
- opening system settings
- handling permissions
- interacting with app lifecycle
- platform-specific helpers (iOS, Catalyst, future platforms)

---

## Naming Convention

All public types in this framework use the **`PL` prefix** to clearly indicate
their platform-level responsibility.

Example:
- `PLUrlOpener`

---

## Modules Responsibility

LFPlatformKit **does not contain**:
- business logic
- networking logic
- concurrency primitives
- pure Foundation utilities

---

## Example

### Opening the App Settings

```swift
import LFPlatformKit

let opener = PLUrlOpener(destination: .appSetting)
opener.open()


