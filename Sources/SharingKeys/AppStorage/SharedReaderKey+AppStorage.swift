import Sharing
import Foundation
import SharingKeysCore

extension SharedReaderKey {
	/// Creates a persistence key that can read and write value to a user default.
	///
	/// - Parameter key: The key to read and write the value to in the user defaults store.
	/// - Returns: A user defaults persistence key.
	public static func appStorage<Value: AppStorageKeyCompatible>(
		_ keyPath: AppStorageKeys.EntryKeyPath,
		store: UserDefaults? = nil
	) -> Self where Self == AppStorageKey<Value> {
		Value.makeAppStorageKey(for: AppStorageKeys[keyPath], store: store)
	}

	/// Creates a persistence key that can read and write value to a user default, transforming
	/// that to a `RawRepresentable` data type.
	///
	/// - Parameter key: The key to read and write the value to in the user defaults store.
	/// - Returns: A user defaults persistence key.
	public static func appStorage<Value: RawRepresentable>(
		_ keyPath: AppStorageKeys.EntryKeyPath,
		store: UserDefaults? = nil
	) -> Self where Self == AppStorageKey<Value>, Value.RawValue: RawRepresentableAppStorageKeyCompatible {
		Value.RawValue.makeRawRepresentableAppStorageKey(for: AppStorageKeys[keyPath], store: store)
	}

	/// Creates a persistence key that can read and write an optional value to a user default, transforming
	/// that to a `RawRepresentable` data type.
	///
	/// - Parameter key: The key to read and write the value to in the user defaults store.
	/// - Returns: A user defaults persistence key.
	public static func appStorage<Value: RawRepresentable>(
		_ keyPath: AppStorageKeys.EntryKeyPath,
		store: UserDefaults? = nil
	) -> Self where Self == AppStorageKey<Value?>, Value.RawValue: OptionallyRawRepresentableAppStorageKeyCompatible {
		Value.RawValue.makeOptionalRawRepresentableAppStorageKey(for: AppStorageKeys[keyPath], store: store)
	}

	/// Creates a persistence key that can read and write value to a user default.
	///
	/// - Parameter key: The key to read and write the value to in the user defaults store.
	/// - Returns: A user defaults persistence key.
	public static func appStorage<Value: AppStorageKeyCompatible>(
		_ keyPath: AppStorageKeys.StrictEntryKeyPath<Value>,
		store: UserDefaults? = nil
	) -> Self where Self == AppStorageKey<Value> {
		Value.makeAppStorageKey(for: AppStorageKeys[keyPath], store: store)
	}

	/// Creates a persistence key that can read and write value to a user default, transforming
	/// that to a `RawRepresentable` data type.
	///
	/// - Parameter key: The key to read and write the value to in the user defaults store.
	/// - Returns: A user defaults persistence key.
	public static func appStorage<Value: RawRepresentable>(
		_ keyPath: AppStorageKeys.StrictEntryKeyPath<Value>,
		store: UserDefaults? = nil
	) -> Self where Self == AppStorageKey<Value>, Value.RawValue: RawRepresentableAppStorageKeyCompatible {
		Value.RawValue.makeRawRepresentableAppStorageKey(for: AppStorageKeys[keyPath], store: store)
	}

	/// Creates a persistence key that can read and write an optional value to a user default, transforming
	/// that to a `RawRepresentable` data type.
	///
	/// - Parameter key: The key to read and write the value to in the user defaults store.
	/// - Returns: A user defaults persistence key.
	public static func appStorage<Value: RawRepresentable>(
		_ keyPath: AppStorageKeys.StrictEntryKeyPath<Value>,
		store: UserDefaults? = nil
	) -> Self where Self == AppStorageKey<Value?>, Value.RawValue: OptionallyRawRepresentableAppStorageKeyCompatible {
		Value.RawValue.makeOptionalRawRepresentableAppStorageKey(for: AppStorageKeys[keyPath], store: store)
	}
}
