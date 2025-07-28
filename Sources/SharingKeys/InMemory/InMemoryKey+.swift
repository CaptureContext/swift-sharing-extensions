import Sharing

@_spi(Internals)
import SharingKeysCore

extension InMemoryKey {
	public static var inMemory: StorageKeyBuilder<InMemoryStorageKeys> { .init() }

	public static subscript(_ keyPath: KeyPath<Self.Type, StorageKeyEntry>) -> String {
		self[keyPath: keyPath].rawValue
	}

	public static subscript(_ keyPath: KeyPath<Self.Type, StorageKeyEntry.Strict<Value>>) -> String {
		self[keyPath: keyPath].rawValue
	}
}
