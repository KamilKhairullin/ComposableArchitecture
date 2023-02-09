protocol AnyStoreSubscriber: AnyObject {
    func _newState(state: Any)
}

protocol StoreSubscriber: AnyStoreSubscriber {
    associatedtype StateType
    
    func newState(state: StateType)
}

extension StoreSubscriber {
    
    func _newState(state: Any) {
        if let typedState = state as? StateType {
            newState(state: typedState)
        }
    }
}
