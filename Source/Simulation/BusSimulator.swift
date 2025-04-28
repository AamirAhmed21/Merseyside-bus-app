import Foundation

class BusSimulator {
    var buses: [Bus] = []

    init(numberOfBuses: Int) {
        let stops = BusStopManager.shared.busStops
        guard !stops.isEmpty else {
            print("No stops loaded.")
            return
        }
        
        for i in 0..<numberOfBuses {
            let busRoute = stops.shuffled().prefix(5)
            let bus = Bus(id: "Bus_\(i+1)", currentStopIndex: 0, route: Array(busRoute))
            buses.append(bus)
        }
    }

    func moveAllBuses() {
        for i in buses.indices {
            buses[i].moveToNextStop()
        }
    }

    func printAllBusLocations() {
        for bus in buses {
            print("\(bus.id) is currently at stop: \(bus.currentStop.name)")
        }
    }
}
