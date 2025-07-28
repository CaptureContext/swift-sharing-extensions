import Sharing
import Foundation

extension Shared where Value: Sendable {
	public init(
		wrappedValue: Value,
		_ key: KeyPath<InMemoryKey<Value>.Type, StorageKeyEntry>
	) {
		self.init(
			wrappedValue: wrappedValue,
			.inMemory(InMemoryKey<Value>[key])
		)
	}

	public init(
		wrappedValue: Value,
		_ key: KeyPath<InMemoryKey<Value>.Type, StorageKeyEntry.Strict<Value>>
	) {
		self.init(
			wrappedValue: wrappedValue,
			.inMemory(InMemoryKey<Value>[key])
		)
	}
}
