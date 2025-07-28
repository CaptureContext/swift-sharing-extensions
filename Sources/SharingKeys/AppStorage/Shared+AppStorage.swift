import Sharing
import Foundation

extension Shared where Value: Sendable & AppStorageKeyCompatible {
	public init(
		wrappedValue: Value,
		_ key: KeyPath<AppStorageKey<Value>.Type, StorageKeyEntry>,
		store: UserDefaults? = nil
	) {
		self.init(
			wrappedValue: wrappedValue,
			Value.makeAppStorageKey(for: AppStorageKey<Value>[key], store: store)
		)
	}

	public init(
		wrappedValue: Value,
		_ key: KeyPath<AppStorageKey<Value>.Type, StorageKeyEntry.Strict<Value>>,
		store: UserDefaults? = nil
	) {
		self.init(
			wrappedValue: wrappedValue,
			Value.makeAppStorageKey(for: AppStorageKey<Value>[key], store: store)
		)
	}
}

extension Shared where Value: Sendable & RawRepresentable {
	public init(
		wrappedValue: Value,
		_ key: KeyPath<AppStorageKey<Value>.Type, StorageKeyEntry>,
		store: UserDefaults? = nil
	) where Value.RawValue: RawRepresentableAppStorageKeyCompatible {
		self.init(
			wrappedValue: wrappedValue,
			Value.RawValue.makeRawRepresentableAppStorageKey(for: AppStorageKey<Value>[key], store: store)
		)
	}

	public init(
		wrappedValue: Value,
		_ key: KeyPath<AppStorageKey<Value>.Type, StorageKeyEntry.Strict<Value>>,
		store: UserDefaults? = nil
	) where Value.RawValue: RawRepresentableAppStorageKeyCompatible {
		self.init(
			wrappedValue: wrappedValue,
			Value.RawValue.makeRawRepresentableAppStorageKey(for: AppStorageKey<Value>[key], store: store)
		)
	}
}


extension Shared where Value: Sendable {
	public init<Wrapped: OptionallyAppStorageKeyCompatible>(
		_ key: KeyPath<AppStorageKey<Value>.Type, StorageKeyEntry>,
		store: UserDefaults? = nil
	) where Value == Wrapped? {
		self.init(
			Value.makeAppStorageKey(for: AppStorageKey<Value>[key], store: store)
		)
	}

	public init<Wrapped: OptionallyAppStorageKeyCompatible>(
		_ key: KeyPath<AppStorageKey<Value>.Type, StorageKeyEntry.Strict<Value>>,
		store: UserDefaults? = nil
	) where Value == Wrapped? {
		self.init(
			Value.makeAppStorageKey(for: AppStorageKey<Value>[key], store: store)
		)
	}

	public init<Wrapped: RawRepresentable>(
		_ key: KeyPath<AppStorageKey<Value>.Type, StorageKeyEntry>,
		store: UserDefaults? = nil
	) where Value == Wrapped?, Wrapped.RawValue: OptionallyRawRepresentableAppStorageKeyCompatible {
		self.init(
			Wrapped.RawValue.makeOptionalRawRepresentableAppStorageKey(for: AppStorageKey<Value>[key], store: store)
		)
	}

	public init<Wrapped: RawRepresentable>(
		_ key: KeyPath<AppStorageKey<Value>.Type, StorageKeyEntry.Strict<Value>>,
		store: UserDefaults? = nil
	) where Value == Wrapped?, Wrapped.RawValue: OptionallyRawRepresentableAppStorageKeyCompatible {
		self.init(
			Wrapped.RawValue.makeOptionalRawRepresentableAppStorageKey(for: AppStorageKey<Value>[key], store: store)
		)
	}
}
