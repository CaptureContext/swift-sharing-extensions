import SharingKeysCore

extension InMemoryStorageKeys {
	public enum SomeDomain: Sendable {
		public enum ChildDomain: Sendable {}
	}

	public enum OtherDomain: Sendable {
		public enum ChildDomain1: Sendable {}
		public enum ChildDomain2: Sendable {}
	}
}

extension StorageKeyBuilder<InMemoryStorageKeys> {
	public var someDomain: Subdomain<InMemoryStorageKeys.SomeDomain> { subdomain() }
	public var otherDomain: Subdomain<InMemoryStorageKeys.OtherDomain> { subdomain() }
}

extension StorageKeyBuilder<InMemoryStorageKeys.SomeDomain> {
	public var childDomain: Subdomain<Domain.ChildDomain> { subdomain() }
	public var someProtectedEntry: Entry.Strict<Int> { entry() }
}

extension StorageKeyBuilder<InMemoryStorageKeys.OtherDomain> {
	public var childDomain1: Subdomain<Domain.ChildDomain1> { subdomain() }
	public var childDomain2: Subdomain<Domain.ChildDomain2> { subdomain() }
}

extension StorageKeyBuilder<InMemoryStorageKeys.SomeDomain.ChildDomain> {
	public var someEntry1: Entry { entry() }
	public var someEntry2: Entry { entry() }
}

extension StorageKeyBuilder<InMemoryStorageKeys.OtherDomain.ChildDomain1> {
	public var someEntry: Entry { entry() }
}

extension StorageKeyBuilder<InMemoryStorageKeys.OtherDomain.ChildDomain2> {
	public var someEntry: Entry { entry() }
}
