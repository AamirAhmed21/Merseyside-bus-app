import Foundation

// Small delay between bus movements
func delay(seconds: Double) {
    RunLoop.current.run(until: Date().addingTimeInterval(seconds))
}

// Entry point
print("🚍 Starting Merseyside Bus Simulation...")

// Load bus stops
let busStopManager = BusStopManager.shared

// Check if bus stops loaded
guard !busStopManager.busStops.isEmpty else {
    print("No bus stops found. Exiting simulation.")
    exit(1)
}

// Initialize simulator with 3 buses
let simulator = BusSimulator(numberOfBuses: 3)

// Start simulation
for tick in 1...10 {
    print("\nTick \(tick): Moving all buses...")
    simulator.moveAllBuses()
    simulator.printAllBusLocations()
    
    delay(seconds: 2) // 2 seconds between each move
}

print("\n🛑 Simulation ended.")
