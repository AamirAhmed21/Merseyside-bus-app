import Foundation

class BusStopManager {
    static let shared = BusStopManager()
    private(set) var busStops: [BusStop] = []

    private init() {
        loadBusStops()
    }

    private func loadBusStops() {
        guard let url = Bundle.module.url(forResource: "BusStopsSuper", withExtension: "json") else {
            print("Failed to locate BusStopsSuper.json")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedStops = try JSONDecoder().decode([BusStop].self, from: data)
            self.busStops = decodedStops
            print("Successfully loaded \(busStops.count) bus stops.")
        } catch {
            print("Error loading bus stops: \(error)")
        }
    }

    func searchBusStops(keyword: String) -> [BusStop] {
        return busStops.filter { 
            $0.name.localizedCaseInsensitiveContains(keyword) || 
            $0.stopID.localizedCaseInsensitiveContains(keyword)
        }
    }

    func busStop(withID id: String) -> BusStop? {
        return busStops.first { $0.stopID == id }
    }
}
