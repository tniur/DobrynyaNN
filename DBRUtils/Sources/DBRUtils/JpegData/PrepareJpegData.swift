import UIKit

public func prepareJpegData(from image: UIImage) -> Data? {
    guard let data = image.jpegData(compressionQuality: 0.8) else {
        return nil
    }
    return data
}
