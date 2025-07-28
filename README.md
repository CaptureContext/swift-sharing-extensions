# swift-sharing-extensions [beta]

[![SwiftPM 6.2](https://img.shields.io/badge/swiftpm-6.2-ED523F.svg?style=flat)](https://swift.org/download/) ![Platforms](https://img.shields.io/badge/Platforms-iOS_13_|_macOS_10.15_|_Catalyst_|_tvOS_14_|_watchOS_7-ED523F.svg?style=flat) [![@capture_context](https://img.shields.io/badge/contact-@capture__context-1DA1F2.svg?style=flat&logo=twitter)](https://twitter.com/capture_context) 

Extensions for [`swift-sharing`](https://github.com/pointfreeco/swift-sharing) package

## Products

- **[SharingKeys](./Sources/SharingKeys)**

  Provides `SharedReaderKey` and `Shared` initializers structural key declarations
  
- **[SharingKeysCore](./Sources/SharingKeysCore)**
  
  Provides helpers for structural key declarations

## Usage

### SharingKeysCore

##### Declaration

Extend `AppStorageKeys` or `InMemoryStorageKeys` and specify available domains.

```swift
import SharingKeysCore

extension InMemoryStorageKeys {
	enum FirstDomain: Sendable {
		enum ChildDomain: Sendable {}
	}

	enum OtherDomain: Sendable {
		enum ChildDomain1: Sendable {}
		enum ChildDomain2: Sendable {}
	}
}
```

Specify accessors by extending  `StorageKeyBuilder` type

```swift
extension StorageKeyBuilder<InMemoryStorageKeys> {
	var firstDomain: Subdomain<InMemoryStorageKeys.FirstDomain> { subdomain() }
	var otherDomain: Subdomain<InMemoryStorageKeys.OtherDomain> { subdomain() }
  
  /// Final key will be "first_domain-some_entry"
  /// And will have the same value as `InMemoryStorageKeys[\.firstDomain.someEntry]`
  var rawEntry: Entry { "first_domain-some_entry" } 
}

extension StorageKeyBuilder<InMemoryStorageKeys.FirstDomain> {
	var childDomain: Subdomain<Domain.ChildDomain> { subdomain() }
  
  /// Final key will be "first_domain-some_entry"
	var someEntry: Entry { entry() }
}

extension StorageKeyBuilder<InMemoryStorageKeys.FirstDomain.ChildDomain> {
  /// Final key will be "first_domain-child_domain-some_entry"
  /// Strict entries are type-checked at call site
  var someProtectedEntry: Entry.Strict<Int> { entry() }
}

extension StorageKeyBuilder<InMemoryStorageKeys.OtherDomain> {
  /// Final key will be "stringLiteral key"
  var customEntry: Entry { "stringLiteral key" }
  
  /// Final key will be "other_domain###FORMATTEDENTRY"
  var formattedEntry: Entry { entry(format: .upper, separator: "###") }
  
  /// Final key will be "other_domain###KEY"
  var formattedEntry2: Entry { entry("key", format: .upper, separator: "###") }
  
  var randomPropertyName: Subdomain<Domain.ChildDomain1> { 
    // Subdomains can be modified just as entries, however subdomains are not
    // ExpressibleByStringLiteral and must be created with a `subdomain` method
  	subdomain("weCould fix The name_here", format: .camel, separator: "---")
  }
}

extension StorageKeyBuilder<InMemoryStorageKeys.OtherDomain.ChildDomain1> {
  /// Final key will be "other_domain---weCouldFixTheNameHere-value"
  var value: Entry { entry() } 
}

// ...
```

> [!NOTE]
> As you might have noticed
>
> - Default formatting for keys is snake_casing components and joining them with `"-"`
> - String literal keys bypass the formatting
> - Custom format and leading separator can be specified for each component
>
> This package uses [`swift-casification`](https://github.com/capturecontext/swift-casification) for formatting

Access your shared state in one of two ways

```swift
import Sharing
import SharingKeys

@Shared(\.inMemory.keyPath.toEntry)
var value: Int = 0
```

```swift
@Shared(.inMemory(\.keyPath.toEntry))
var value: Int = 0
```



## Installation

### Basic

You can add swift-sharing-extensions to an Xcode project by adding it as a package dependency.

1. From the **File** menu, select **Swift Packages › Add Package Dependency…**
2. Enter [`"https://github.com/capturecontext/swift-sharing-extensions"`](https://github.com/capturecontext/swift-sharing-extensions) into the package repository URL text field
3. Choose products you need to link them to your project.

### Recommended

If you use SwiftPM for your project structure, add DeclarativeConfiguration to your package file. 

```swift
.package(
  url: "git@github.com:capturecontext/swift-sharing-extensions.git", 
  .upToNextMinor(from: "0.0.1")
)
```
or via HTTPS

```swift
.package(
  url: "https://github.com:capturecontext/swift-sharing-extensions.git", 
  .upToNextMinor(from: "0.0.1")
)
```

Do not forget about target dependencies:

```swift
.product(
  name: "SharingKeys", 
  package: "swift-sharing-extensions"
)
```

or for the targets that don't need to read/write values to Shared storage but only to declare storage keys

```swift
.product(
  name: "SharingKeysCore", 
  package: "swift-sharing-extensions"
)
```

## License

This library is released under the MIT license. See [LICENSE](./LICENSE) for details.
