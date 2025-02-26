import SwiftUI
import Nivelir

public struct SomeScreen: Screen {

    public init() {}

    public func build(navigator: ScreenNavigator) -> UIViewController {
        let viewModel = SomeViewModel()
        return UIHostingController(rootView: SomeView(viewModel: viewModel))
    }
}
