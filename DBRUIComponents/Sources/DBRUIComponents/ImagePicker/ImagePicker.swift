import SwiftUI
import PhotosUI

public struct ImagePicker: UIViewControllerRepresentable {
    public typealias Completion = (UIImage) -> Void
    private let onImagePicked: Completion

    public init(onImagePicked: @escaping Completion) {
        self.onImagePicked = onImagePicked
    }

    public func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    public func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    public func makeCoordinator() -> Coordinator {
        Coordinator(onImagePicked: onImagePicked)
    }

    public final class Coordinator: NSObject, PHPickerViewControllerDelegate {
        private let onImagePicked: Completion

        public init(onImagePicked: @escaping Completion) {
            self.onImagePicked = onImagePicked
        }

        public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider,
                  provider.canLoadObject(ofClass: UIImage.self) else {
                return
            }

            provider.loadObject(ofClass: UIImage.self) { image, error in
                guard let uiImage = image as? UIImage else { return }
                Task { @MainActor in
                    self.onImagePicked(uiImage)
                }
            }
        }
    }
}
