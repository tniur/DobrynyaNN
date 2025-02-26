import SwiftUI
import DBUIComponents

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            ExampleTextView(text: viewModel.getExampleText())
            Spacer()
            ExampleButton(title: viewModel.getExampleButtonText(), color: .red) {
                viewModel.exampleButtonTapped()
            }
        }
    }
}
