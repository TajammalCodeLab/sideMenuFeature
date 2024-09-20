//
//  LocationMenuViewController.swift
//  sideMenuFeature
//
//  Created by SID on 19/09/2024.
//

import UIKit
import CoreLocation
import MapKit

class LocationMenuViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager: CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /// For location
        setupLocationManager()
    }
    // MARK: Methods
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        checkIfLocationServicesEnable()
    }
    
    private func checkIfLocationServicesEnable(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.requestWhenInUseAuthorization()
            // The startUpdatingLocation() will be called once the user grants permission
        } else {
            // Handle the case where location services are not enabled
            print("Location services are disabled. Please enable them in settings.")
        }
    }
    // For iOS 14 and later
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorizationStatus(manager: manager)
    }
    
    // For iOS 13 and earlier
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthorizationStatus(manager: manager)
    }
    
    private func checkAuthorizationStatus(manager: CLLocationManager) {
        let status: CLAuthorizationStatus
        if #available(iOS 14.0, *) {
            status = manager.authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager?.startUpdatingLocation()
            print("Location services authorized, starting location updates.")
        case .denied, .restricted:
            // Handle the case where location access is denied or restricted
            print("Location access denied or restricted.")
        case .notDetermined:
            // The user hasn't granted or denied permission yet
            print("Waiting for the user to grant location permission.")
        @unknown default:
            print("Unknown authorization status.")
        }
    }

}

extension LocationMenuViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        map.setRegion(region, animated: true)
        map.showsUserLocation = true
    }
    
}
