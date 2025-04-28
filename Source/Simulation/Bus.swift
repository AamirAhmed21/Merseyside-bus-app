import Foundation

struct Bus {
    let id: String
    var currentStopIndex: Int
    var route: [BusStop]

    mutating func moveToNextStop() {
        guard !route.isEmpty else { return }
        currentStopIndex = (currentStopIndex + 1) % route.count
        print("Bus \(id) moved to stop: \(currentStop.name)")
    }

    var currentStop: BusStop {
        return route[currentStopIndex]
    }
}
