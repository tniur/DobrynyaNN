import SwiftUI
import DBUIComponents

struct SomeView: View {
    @ObservedObject var viewModel: SomeViewModel

    var body: some View {
        VStack {
            ExampleTextView(text: viewModel.getSomeText())
            Spacer()
        }
    }
}

#Preview {
    SomeView(viewModel: SomeViewModel())
}
