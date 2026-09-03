import Casification

extension String.Casification.Modifiers {
	public struct StorageKey: String.Casification.Modifier {
		public init() {}

		public func transform(_ input: Substring) -> Substring {
			let output: String = withCasification {
				$0.common.numbers.boundaryOptions.remove(.endingNumber([]))
			} operation: {
				String(input).case(.snake)
			}
			return output[...]
		}
	}
}

extension String.Casification.Modifier
where Self == String.Casification.Modifiers.StorageKey {
	public static var storageKey: Self { .init() }
}
