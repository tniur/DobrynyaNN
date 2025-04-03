import SwiftUI

struct SplashView: View {
    private var viewModel: SplashViewModel

    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Spacer()
        }
        .onAppear(perform: viewModel.)
    }
}
