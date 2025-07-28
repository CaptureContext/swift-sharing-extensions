import Sharing

@_spi(Internals)
import SharingKeysCore

extension AppStorageKey {
	public static var appStorage: StorageKeyBuilder<AppStorageKeys> { .init() }

	public static subscript(_ keyPath: KeyPath<Self.Type, StorageKeyEntry>) -> String {
		self[keyPath: keyPath].rawValue
	}

	public static subscript(_ keyPath: KeyPath<Self.Type, StorageKeyEntry.Strict<Value>>) -> String {
		self[keyPath: keyPath].rawValue
	}
}
