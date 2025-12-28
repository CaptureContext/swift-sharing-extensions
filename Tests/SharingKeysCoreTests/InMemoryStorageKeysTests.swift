import Testing
import SharingKeysCore
import _SharingKeysTesting

@Suite
struct InMemoryStorageKeysTests {
	@Test
	func live() {
		#expect(InMemoryStorageKeys[\.someDomain.someProtectedEntry] == "some_domain-some_protected_entry")
		#expect(InMemoryStorageKeys[\.someDomain.childDomain.someEntry1] == "some_domain-child_domain-some_entry_1")
		#expect(InMemoryStorageKeys[\.someDomain.childDomain.someEntry2] == "some_domain-child_domain-some_entry_2")
		#expect(InMemoryStorageKeys[\.otherDomain.childDomain1.someEntry] == "other_domain-child_domain_1-some_entry")
		#expect(InMemoryStorageKeys[\.otherDomain.childDomain2.someEntry] == "other_domain-child_domain_2-some_entry")
		#expect(InMemoryStorageKeys[\.directEntry] == "direct_entry")
	}
}

extension StorageKeyBuilder where Domain == InMemoryStorageKeys {
	var directEntry: Entry { entry() }
}
