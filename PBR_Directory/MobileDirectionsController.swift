//
//  MobileDirectionsController.swift
//  PBR_Directory
//
//  Created by Owner on 4/19/15.
//  Copyright (c) 2015 AlexWatts. All rights reserved.
//

import Foundation
import MapKit
import AddressBook
import CoreLocation

class MobileDirectionsController:UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var MobileDirectionMap: MKMapView!
    
    var locationManager = CLLocationManager()
    var locationsModel = MyLocationsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.MobileDirectionMap.delegate = self
        self.MobileDirectionMap.showsUserLocation = true
        self.locationManager.requestWhenInUseAuthorization()
        
        //Get hotel coordinates and place an annotation there
        let hotel = locationsModel.locations[0]
        addAnnotation(hotel)
        
        //get coordinates of the hotel
        let cords = CLLocationCoordinate2D(latitude: hotel.latitude, longitude: hotel.longitude)
        //specify visible region
        let region:MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(cords, 10000.0, 10000.0)
        //specify address metadata displayed in Maps app
        let address:[NSObject:NSString] = [
            kABPersonAddressStreetKey:"2700 Perdido Beach Boulevard",
            kABPersonAddressCityKey: "Orange Beach",
            kABPersonAddressStateKey: "AL",
            kABPersonAddressZIPKey: "36561",
            kABPersonAddressCountryCodeKey: "US"]
        
        let placemark = MKPlacemark(coordinate: cords, addressDictionary: address)
        let mapItem = MKMapItem(placemark: placemark)
        
        //Specify options of how the Maps app will display the map item
        let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMapsWithLaunchOptions(options)                
        
    }
    
    func addAnnotation(location:Location){
        
        //TODO:Create a MKPointAnnotation
        var annotation: MKPointAnnotation = MKPointAnnotation()
        
        //TODO: and set it's coordinate using coordinate property
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude , longitude: location.longitude)
        
        self.zoomOnLocation(annotation.coordinate)
        annotation.title = location.title
        
        //TODO: Add annotation to the map
        self.MobileDirectionMap.addAnnotation(annotation)
        
    }
    
    func zoomOnLocation(location:CLLocationCoordinate2D){
        var span = MKCoordinateSpan(latitudeDelta: 10.907872, longitudeDelta: 10.9109863)
        var newRegion: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        self.MobileDirectionMap.setRegion(newRegion, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func displayDirections(sender: AnyObject) {
        
        //get coordinates of the location you want to display
        let cords = CLLocationCoordinate2D(latitude: 30.5495, longitude: -87.2181)
        //specify visible region
        let region:MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(cords, 10000.0, 10000.0)
        //specify address metadata displayed in Maps app
        let address:[NSObject:NSString] = [
            kABPersonAddressStreetKey:"11000 University Pkwy",
            kABPersonAddressCityKey: "Pensacola",
            kABPersonAddressStateKey: "FL",
            kABPersonAddressZIPKey: "32514",
            kABPersonAddressCountryCodeKey: "US"]
        
        let placemark = MKPlacemark(coordinate: cords, addressDictionary: address)
        let mapItem = MKMapItem(placemark: placemark)
        
        //Specify options of how the Maps app will display the map item
        let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMapsWithLaunchOptions(options)
        
    }

    
    
    
}