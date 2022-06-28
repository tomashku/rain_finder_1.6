//
//  Airport.swift
//  rain_finder_1.6
//
//  Created by Tomasz Zuczek on 28/06/2022.
//

import Foundation

class Airportx{
    
    var type: String?
    var elevation_ft: String?
    var gps_code: String?
    var home_link: String?
    var iata_code: String?
    var ident: String?
    var iso_country: String?
    var latitude_deg: String?
    var longitude_deg: String?
    var name: String?
    var scheduled_service: String?
    var keywords: String?
    var local_code: String?
    var municipality: String?
    var wikipedia_link: String?
    var id: String?
    
    init(type: String? = nil, elevation_ft: String? = nil, gps_code: String? = nil, home_link: String? = nil, iata_code: String? = nil, ident: String? = nil, iso_country: String? = nil, latitude_deg: String? = nil, longitude_deg: String? = nil, name: String? = nil, scheduled_service: String? = nil, keywords: String? = nil, local_code: String? = nil, municipality: String? = nil, wikipedia_link: String? = nil, id: String? = nil) {
        self.type = type
        self.elevation_ft = elevation_ft
        self.gps_code = gps_code
        self.home_link = home_link
        self.iata_code = iata_code
        self.ident = ident
        self.iso_country = iso_country
        self.latitude_deg = latitude_deg
        self.longitude_deg = longitude_deg
        self.name = name
        self.scheduled_service = scheduled_service
        self.keywords = keywords
        self.local_code = local_code
        self.municipality = municipality
        self.wikipedia_link = wikipedia_link
        self.id = id
    }
}
