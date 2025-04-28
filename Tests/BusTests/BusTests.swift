import XCTest
@testable import MerseysideBusBackend

final class BusTests: XCTestCase {
    func testBusMovement() {
        let stops = [
            BusStop(stopID: "stop_1", name: "Stop A", latitude: 53.0, longitude: -2.0),
            BusStop(stopID: "stop_2", name: "Stop B", latitude: 53.1, longitude: -2.1)
        ]
        var bus = Bus(id: "Bus_1", currentStopIndex: 0, route: stops)

        bus.moveToNextStop()
        XCTAssertEqual(bus.currentStop.name, "Stop B")

        bus.moveToNextStop()
        XCTAssertEqual(bus.currentStop.name, "Stop A")
    }
}
