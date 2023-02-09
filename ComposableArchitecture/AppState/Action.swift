protocol Action {}

enum CounterAction: Action {
    case plus(Int)
    case minus(Int)
}
