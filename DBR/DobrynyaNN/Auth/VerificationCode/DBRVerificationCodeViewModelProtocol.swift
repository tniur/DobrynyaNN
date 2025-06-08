import Foundation

protocol DBRVerificationCodeViewModelProtocol: ObservableObject {
    var code: String { get set }
    var phoneNumber: String { get set }
    
    var codeLenght: Int { get }
    var isCodeIncorrect: Bool { get set }
}
