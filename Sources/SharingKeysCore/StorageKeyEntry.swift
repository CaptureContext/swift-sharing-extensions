import Casification

public struct StorageKeyEntry: ExpressibleByStringLiteral {
	public let rawValue: String

	@inlinable
	public init(stringLiteral value: String) {
		self.init(rawValue: value)
	}

	public init(rawValue: String) {
		self.rawValue = rawValue
	}

	public struct Strict<Value>: ExpressibleByStringLiteral {
		public let rawValue: String

		@inlinable
		public init(stringLiteral value: String) {
			self.init(rawValue: value)
		}

		public init(rawValue: String) {
			self.rawValue = rawValue
		}
	}
}
