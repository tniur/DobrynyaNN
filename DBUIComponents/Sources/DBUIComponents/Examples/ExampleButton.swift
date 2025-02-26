import SwiftUI

public struct ExampleButton: View {
    private let title: String
    private let color: Color
    private let action: () -> Void

    public init(title: String, color: Color, action: @escaping () -> Void) {
        self.title = title
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
        .padding()
    }
}

#Preview {
    ExampleButton(title: "Press ME!", color: .red, action: {})
}
