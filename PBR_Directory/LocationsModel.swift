//
//  LocationsModel.swift
//  PBR_Directory
//
//  Created by Owner on 4/20/15.
//  Copyright (c) 2015 AlexWatts. All rights reserved.
//

import Foundation


class Location{
    
    var title =  "Perdido Beach Resort"
    var latitude = 30.3015
    var longitude = -87.5615
    
}

class MyLocationsManager{
    var locations = [Location]()
    
    init(){
        
        //Add the resort data to locations array
        var PBR:Location = Location()
        
        PBR.title = "Perdido Beach Resort"
        PBR.latitude = 30.3015
        PBR.longitude = -87.5615
        
        locations.append(PBR)
        
        //Add the mobile regional airport data to locations array
        var MobileRAP:Location = Location()
        
        MobileRAP.title = "Mobile Regional Airport"
        MobileRAP.latitude = 30.6914
        MobileRAP.longitude = -88.2428
        
        locations.append(MobileRAP)
        
        //Add the pensacola international airport data to locations array
        var PcolaIAP:Location = Location()
        
        PcolaIAP.title = "Pensacola International Airport"
        PcolaIAP.latitude = 30.4733
        PcolaIAP.longitude = -87.1867
        
        locations.append(PcolaIAP)
        
    }
}