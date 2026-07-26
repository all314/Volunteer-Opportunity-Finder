import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let manager = CLLocationManager()

    @Published var latitude: Double = 0
    @Published var longitude: Double = 0
    @Published var locationFound = false


    override init() {
        super.init()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }


    func requestLocation() {

        if manager.authorizationStatus == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }

        manager.startUpdatingLocation()

    }


    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {

        guard let newestLocation = locations.last else {
            return
        }


        latitude = newestLocation.coordinate.latitude
        longitude = newestLocation.coordinate.longitude

        locationFound = true


        print("CURRENT LOCATION:")
        print("Latitude:", latitude)
        print("Longitude:", longitude)


        // Stop after getting the newest location
        manager.stopUpdatingLocation()

    }


    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {

        print("Location Error:")
        print(error.localizedDescription)

    }

}
