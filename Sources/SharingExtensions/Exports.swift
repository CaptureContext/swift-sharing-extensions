@_exported import Sharing
@_exported import SharingKeys

extension Shared {
	public var mutableValue: Value {
		get { wrappedValue }
		set { withLock { $0 = newValue } }
	}
}
