public enum Greetings {
    public static func hello(_ name: String? = nil) -> String {
        "Hello, \(name ?? "iOS")!"
    }
}
