import Casification

public struct StorageKeyBuilder<Domain> {
	public typealias Subdomain<Child> = StorageKeyBuilder<Child>
	public typealias Entry = StorageKeyEntry

	public var rawValue: String

	@_spi(Internals)
	public init() {
		self.rawValue = ""
	}

	@_spi(Internals)
	public init(rawValue: String) {
		self.rawValue = rawValue
	}
}

extension StorageKeyBuilder {
	public func subdomain<Child>(
		_ key: String = #function,
		format modifier: String.Casification.Modifier = .snake,
		separator: String = "-"
	) -> Subdomain<Child> {
		let value = join(rawValue, key.case(modifier), separator: separator)
		return .init(rawValue: value)
	}

	@inlinable
	public func entry<T>(
		_ key: String = #function,
		format modifier: String.Casification.Modifier = .snake,
		separator: String = "-"
	) -> Entry.Strict<T> {
		let base: Entry = entry(key, format: modifier, separator: separator)
		return .init(rawValue: base.rawValue)
	}

	@inlinable
	public func entry(
		_ key: String = #function,
		format modifier: String.Casification.Modifier = .snake,
		separator: String = "-"
	) -> Entry {
		let value = join(rawValue, key.case(modifier), separator: separator)
		return .init(rawValue: value)
	}

	@usableFromInline
	internal func join(_ key1: String, _ key2: String, separator: String) -> String {
		return [key1, key2].filter { !$0.isEmpty }.joined(separator: separator)
	}
}
