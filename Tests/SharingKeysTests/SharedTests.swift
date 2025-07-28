import Testing
import Sharing
import SharingKeys
import _SharingKeysTesting

@Suite
struct SharedTests {
	@Test
	func appStorage() {
		@Shared(\.appStorage.someDomain.childDomain.someEntry1)
		var entry: Int = 0

		@Shared(.appStorage(\.someDomain.childDomain.someEntry1))
		var entry1: Int = 0

		// Won't compile ✅
		// @Shared(\.appStorage.someDomain.childDomain.typedEntry)
		// var typedEntry: Int = 0

		@Shared(\.appStorage.someDomain.childDomain.typedEntry)
		var typedEntry: Bool = false

		// Won't compile ✅
		// @Shared(.appStorage(\.someDomain.childDomain.typedEntry))
		// var typedEntry1: Int = 0

		@Shared(.appStorage(\.someDomain.childDomain.typedEntry))
		var typedEntry1: Bool = false
	}

	@Test
	func inMemory() {
		@Shared(\.inMemory.otherDomain.childDomain1.someEntry)
		var entry: Int = 0

		@Shared(.inMemory(\.otherDomain.childDomain1.someEntry))
		var entry1: Int = 0

		// Won't compile ✅
		// @Shared(\.inMemory.someDomain.someProtectedEntry)
		// var typedEntry: Bool = false

		@Shared(\.inMemory.someDomain.someProtectedEntry)
		var typedEntry: Int = 0

		// Won't compile ✅
		// @Shared(.inMemory(\.someDomain.someProtectedEntry))
		// var typedEntry1: Bool = false

		@Shared(.inMemory(\.someDomain.someProtectedEntry))
		var typedEntry1: Int = 0
	}
}
