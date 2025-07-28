import Casification

public protocol StorageKeysTopLevelDomainProtocol: Sendable {
	typealias EntryKeyPath = KeyPath<StorageKeyBuilder<Self>, StorageKeyEntry>
	typealias StrictEntryKeyPath<Value> = KeyPath<StorageKeyBuilder<Self>, StorageKeyEntry.Strict<Value>>
	typealias Builder<Domain> = StorageKeyBuilder<Domain>
	
	static subscript(_ keyPath: EntryKeyPath) -> String { get }
	static subscript<T>(_ keyPath: StrictEntryKeyPath<T>) -> String { get }
}

extension StorageKeysTopLevelDomainProtocol {
	public static subscript(_ keyPath: EntryKeyPath) -> String {
		StorageKeyBuilder()[keyPath: keyPath].rawValue
	}

	public static subscript<Value>(_ keyPath: StrictEntryKeyPath<Value>) -> String {
		StorageKeyBuilder()[keyPath: keyPath].rawValue
	}

	public func subdomain<Child>(
		_ key: String = #function,
		format modifier: String.Casification.Modifier = .snake,
		separator: String = "-"
	) -> Builder<Child> {
		return Builder<Self>(rawValue: "")
			.subdomain(key, format: modifier, separator: separator)
	}
}
