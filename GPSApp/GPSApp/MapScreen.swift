//
//  ViewController.swift
//  GPSApp
//
//  Created by 90301422 on 1/11/19.
//  Copyright © 2019 Nico D. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var mapView: MKMapView!

    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 50000
    var mapTypeVar = 0
    var dLatitude: Double = 0
    var dLongitude: Double = 0
    

    override var canBecomeFirstResponder: Bool {
        get { return true }
    }
    
    // when phone shakes change map appearance
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if mapTypeVar == 0 {
            mapView.mapType = MKMapType.standard
                mapTypeVar = 1
            } else {
                mapView.mapType = MKMapType.hybrid
                mapTypeVar = 0
        }
    }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        self.becomeFirstResponder()
    }

    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
        
    }
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // show alert letting the user know they have to turn this on
        }
    }

    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            // show alter letting know what's up
            break
        case .denied:
            // show alert instructing how to turn on permissions
            break
        case .authorizedAlways:
            break
        }
    }
    
    
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        // let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        // mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    
    
    //func getDirections() {
        //guard let location = locationManager.location?.coordinate else {
            // TODO: inform user location is not enabled
          //  return
       // }
        
     //   let request = createDirectionsRequest(from: location)
   // }
    
  //  func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        //let destinationCoordinate       =11 CLLocationCoordinate2DMake(latitude!, longitude!)
       // let startingLocation        = MKPlacemark(coordinate: coordinate)
       // let destination             = MKPlacemark(coordinate: destinationCoordinate)
        
      //  let request                 = MKDirections.Request()
      //  request.source              = MKMapItem(placemark: startingLocation)
      //  request.destination         = MKMapItem(placemark: destination)
      //  request.transportType       = .automobile
      //  request.requestsAlternateRoutes = true
        
       // return request
  //  }
    
    
    
    
    
    // Search Bar
    // search bar appears when clicked
    @IBAction func search(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        //Activity Indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.white
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        //Hide search bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        // Create the search request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            
            
            if response == nil
            {
                print("error")
            }
            else
            {
                // Remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
            
                //Create annotation
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.mapView.addAnnotation(annotation)
                
                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
                
            }
        }
    }
}
