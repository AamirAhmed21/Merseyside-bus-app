import Foundation

struct BusStop: Codable, Identifiable {
    var id: String { stopID }
    let stopID: String
    let name: String
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case stopID = "id"
        case name
        case latitude
        case longitude
    }
}
