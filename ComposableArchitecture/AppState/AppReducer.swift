func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(counterState: counterReducer(action: action, state: state?.counterState))
}

func counterReducer(action: Action, state: CounterState?) -> CounterState {
    var state = state ?? CounterState(initialValues: [])

    switch action {
    case let CounterAction.plus(index):
        if state.values.count > index {
            state.values[index] += 1
        }
    case let CounterAction.minus(index):
        if state.values.count > index {
            state.values[index] -= 1
        }
    default:
        break
    }
    
    return state
}

