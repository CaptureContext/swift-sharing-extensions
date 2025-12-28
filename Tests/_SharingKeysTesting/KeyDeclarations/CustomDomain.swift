import SharingKeysCore

// You'll have to implement your own reader for custom domain
public enum CustomStorageKeys: StorageKeysTopLevelDomainProtocol {}

extension CustomStorageKeys {
	public enum CustomDomain {}
}

extension StorageKeyBuilder<CustomStorageKeys> {
	public var customDomain: Subdomain<Domain.CustomDomain> { subdomain() }
}

extension StorageKeyBuilder<CustomStorageKeys.CustomDomain> {
	public var someValue: Entry { entry() }
}
