import Sharing
import SharingKeysCore

extension SharedReaderKey {
	public static func inMemory<Value>(_ keyPath: InMemoryStorageKeys.EntryKeyPath) -> Self
	where Self == InMemoryKey<Value> {
		.inMemory(InMemoryStorageKeys[keyPath])
	}

	public static func inMemory<Value>(_ keyPath: InMemoryStorageKeys.StrictEntryKeyPath<Value>) -> Self
	where Self == InMemoryKey<Value> {
		.inMemory(InMemoryStorageKeys[keyPath])
	}
}
