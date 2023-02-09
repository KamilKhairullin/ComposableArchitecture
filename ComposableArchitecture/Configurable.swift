import Foundation

protocol Configurable: AnyObject {
    associatedtype Model
    func configure(with model: Model)
}
