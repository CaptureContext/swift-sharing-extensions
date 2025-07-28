import SharingKeysCore

extension AppStorageKeys {
	public enum SomeDomain: Sendable {
		public enum ChildDomain: Sendable {}
	}

	public enum OtherDomain: Sendable {
		public enum ChildDomain1: Sendable {}
		public enum ChildDomain2: Sendable {}
	}
}

extension StorageKeyBuilder<AppStorageKeys> {
	public var someDomain: Subdomain<AppStorageKeys.SomeDomain> { subdomain() }
	public var otherDomain: Subdomain<AppStorageKeys.OtherDomain> { subdomain() }
}

extension StorageKeyBuilder<AppStorageKeys.SomeDomain> {
	public var childDomain: Subdomain<Domain.ChildDomain> { subdomain() }
	public var someEntry: Entry { entry() }
}

extension StorageKeyBuilder<AppStorageKeys.OtherDomain> {
	public var childDomain1: Subdomain<Domain.ChildDomain1> { subdomain() }
	public var childDomain2: Subdomain<Domain.ChildDomain2> { subdomain() }
}

extension StorageKeyBuilder<AppStorageKeys.SomeDomain.ChildDomain> {
	public var someEntry1: Entry { entry() }
	public var someEntry2: Entry { entry() }
	public var typedEntry: Entry.Strict<Bool> { entry() }
}

extension StorageKeyBuilder<AppStorageKeys.OtherDomain.ChildDomain1> {
	public var someEntry: Entry { entry() }
}

extension StorageKeyBuilder<AppStorageKeys.OtherDomain.ChildDomain2> {
	public var someEntry: Entry { entry() }
}
