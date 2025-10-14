import SwiftUI
import AppCore

struct ContentView: View {
    @State private var name = ""

    var body: some View {
        VStack(spacing: 16) {
            Text(Greetings.hello(name.isEmpty ? nil : name))
                .font(.title)
            TextField("Enter name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
