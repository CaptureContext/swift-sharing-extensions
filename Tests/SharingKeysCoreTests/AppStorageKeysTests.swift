import Testing
import SharingKeysCore
import _SharingKeysTesting

@Suite
struct InMemoryStorageKeysTests {
	@Test
	func live() {
		#expect(AppStorageKeys[\.someDomain.childDomain.someEntry1] == "some_domain-child_domain-some_entry_1")
		#expect(AppStorageKeys[\.someDomain.childDomain.someEntry2] == "some_domain-child_domain-some_entry_2")
		#expect(AppStorageKeys[\.someDomain.childDomain.typedEntry] == "some_domain-child_domain-typed_entry")
		#expect(AppStorageKeys[\.otherDomain.childDomain1.someEntry] == "other_domain-child_domain_1-some_entry")
		#expect(AppStorageKeys[\.otherDomain.childDomain2.someEntry] == "other_domain-child_domain_2-some_entry")
	}
}
