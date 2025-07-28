import Sharing
import Foundation

// MAYBE TODO: Add AppStorage support for any RawRepresentable types where RawValue is AppStorageKeyCompatible?
// This has to be done in `swift-sharing` package
// Currently swift-sharing supports only Int and String representables

// MAYBE TODO: Add AppStorage support for any BinaryInteger/BinaryFloatingPoint?
// This has to be done in `swift-sharing` package
// Currently swift-sharing supports only Int and Double types

typealias EveryAppStorageKeyCompatible =
AppStorageKeyCompatible
& OptionallyAppStorageKeyCompatible
& RawRepresentableAppStorageKeyCompatible
& OptionallyRawRepresentableAppStorageKeyCompatible

public protocol AppStorageKeyCompatible {
	static func makeAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self>
}

public protocol OptionallyAppStorageKeyCompatible {
	static func makeOptionalAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Optional<Self>>
}

public protocol RawRepresentableAppStorageKeyCompatible {
	static func makeRawRepresentableAppStorageKey<T: RawRepresentable<Self>>(
		for key: String,
		store: UserDefaults?
	) -> AppStorageKey<T>
}

public protocol OptionallyRawRepresentableAppStorageKeyCompatible {
	static func makeOptionalRawRepresentableAppStorageKey<T: RawRepresentable<Self>>(
		for key: String,
		store: UserDefaults?
	) -> AppStorageKey<Optional<T>>
}

extension Optional: AppStorageKeyCompatible where Wrapped: OptionallyAppStorageKeyCompatible {
	public static func makeAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self> {
		Wrapped.makeOptionalAppStorageKey(for: key, store: store)
	}
}

extension Bool: AppStorageKeyCompatible, OptionallyAppStorageKeyCompatible {
	public static func makeAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self> {
		.appStorage(key, store: store)
	}

	public static func makeOptionalAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self?> {
		.appStorage(key, store: store)
	}
}

extension Int: EveryAppStorageKeyCompatible {
	public typealias OptionalAppStorageRawRepresentationTarget = Self

	public static func makeAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self> {
		.appStorage(key, store: store)
	}

	public static func makeOptionalAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self?> {
		.appStorage(key, store: store)
	}

	public static func makeRawRepresentableAppStorageKey<T: RawRepresentable<Self>>(for key: String, store: UserDefaults?) -> AppStorageKey<T> {
		.appStorage(key, store: store)
	}

	public static func makeOptionalRawRepresentableAppStorageKey<T: RawRepresentable<Self>>(for key: String, store: UserDefaults?) -> AppStorageKey<T?> {
		.appStorage(key, store: store)
	}
}

extension Double: AppStorageKeyCompatible, OptionallyAppStorageKeyCompatible {
	public static func makeAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self> {
		.appStorage(key, store: store)
	}

	public static func makeOptionalAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self?> {
		.appStorage(key, store: store)
	}
}

extension String: EveryAppStorageKeyCompatible {
	public typealias OptionalAppStorageRawRepresentationTarget = Self

	public static func makeAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self> {
		.appStorage(key, store: store)
	}

	public static func makeOptionalAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self?> {
		.appStorage(key, store: store)
	}

	public static func makeRawRepresentableAppStorageKey<T: RawRepresentable<Self>>(for key: String, store: UserDefaults?) -> AppStorageKey<T> {
		.appStorage(key, store: store)
	}

	public static func makeOptionalRawRepresentableAppStorageKey<T: RawRepresentable<Self>>(for key: String, store: UserDefaults?) -> AppStorageKey<T?> {
		.appStorage(key, store: store)
	}
}

extension URL: AppStorageKeyCompatible, OptionallyAppStorageKeyCompatible {
	public static func makeAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self> {
		.appStorage(key, store: store)
	}

	public static func makeOptionalAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self?> {
		.appStorage(key, store: store)
	}
}

extension Data: AppStorageKeyCompatible, OptionallyAppStorageKeyCompatible {
	public static func makeAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self> {
		.appStorage(key, store: store)
	}

	public static func makeOptionalAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self?> {
		.appStorage(key, store: store)
	}
}

extension Date: AppStorageKeyCompatible, OptionallyAppStorageKeyCompatible {
	public static func makeAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self> {
		.appStorage(key, store: store)
	}

	public static func makeOptionalAppStorageKey(for key: String, store: UserDefaults?) -> AppStorageKey<Self?> {
		.appStorage(key, store: store)
	}
}
