typealias Reducer<StateType> = (_ action: Action, _ state: StateType?) -> StateType

class Store<State> {
    
    private(set) var state: State! {
        didSet {
            subscribers.forEach {
                $0._newState(state: state)
            }
        }
    }
    
    private var reducer: Reducer<State>
    
    var subscribers: [AnyStoreSubscriber] = []
    
    init(
        reducer: @escaping Reducer<State>,
        state: State
    ) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(action: Action) {
        state = reducer(action, state)
    }
}
