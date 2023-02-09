struct AppState {
    
    // MARK: - Properties
    
    var counterState: CounterState
    
    // MARK: - Lifecycle
    
    init(counterState: CounterState) {
        self.counterState = counterState
    }
}

struct CounterState {
    
    // MARK: - Properties
    
    var values: [Int]
    
    // MARK: - Lifecycle
    
    init(initialValues values: [Int]) {
        self.values = values
    }
}

