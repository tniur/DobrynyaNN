import SwiftUI

struct DBRSplashView: View {
    private var viewModel: DBRSplashViewModel

    init(viewModel: DBRSplashViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Spacer()
        }
        .onAppear(perform: viewModel.checkAuth)
    }
}
