//
//  LocationViewModel.swift
//  Halfway
//
//  Created by Johannes on 2020-11-22.
//  Copyright © 2020 Halfway. All rights reserved.
//

import Foundation
import Combine
import CoreLocation

class LocationViewModel: NSObject, ObservableObject{
    @Published var userCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    @Published var locationAccessed = false
    @Published var authStatus  = CLLocationManager.authorizationStatus()
    
    private let locationManager = CLLocationManager()
    override init() {
        super.init()
        self.locationManager.delegate = self

        guard CLLocationManager.locationServicesEnabled() else {
          return
        }
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()

        self.authStatus = CLLocationManager.authorizationStatus()
        if self.authStatus == .authorizedAlways || self.authStatus == .authorizedWhenInUse {
            userCoordinates = self.locationManager.location!.coordinate
            locationAccessed = true
        }
        
    }
    
    func askForLocationAccess(){
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        self.authStatus = CLLocationManager.authorizationStatus()
        
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    
    userCoordinates = location.coordinate
    if !locationAccessed{
        locationAccessed = true
    }
  }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authStatus = status
    }
}
