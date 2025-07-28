import Testing

@_spi(Internals)
@testable import SharingKeysCore

@Suite
struct StorageKeyBuilderTests {
	@Test
	func live() {
		let builder = StorageKeyBuilder<Void>()

		let customSubdomain: StorageKeyBuilder<Void> = builder.subdomain("void")
		#expect(customSubdomain.rawValue == "void")

		let defaultSubdomain: StorageKeyBuilder<Void> = builder.subdomain()
		#expect(defaultSubdomain.rawValue == "live")

		#expect(customSubdomain.entry("entry").rawValue == "void-entry")
		#expect(customSubdomain.entry().rawValue == "void-live")
	}
}
