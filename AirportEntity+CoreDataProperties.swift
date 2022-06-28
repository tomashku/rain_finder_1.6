//
//  AirportEntity+CoreDataProperties.swift
//  rain_finder_1.6
//
//  Created by Tomasz Zuczek on 28/06/2022.
//
//

import Foundation
import CoreData


extension AirportEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AirportEntity> {
        return NSFetchRequest<AirportEntity>(entityName: "AirportEntity")
    }

    @NSManaged public var continent: String?
    @NSManaged public var elevation_ft: String?
    @NSManaged public var gps_code: String?
    @NSManaged public var home_link: String?
    @NSManaged public var iata_code: String?
    @NSManaged public var id: String?
    @NSManaged public var ident: String?
    @NSManaged public var iso_country: String?
    @NSManaged public var keywords: String?
    @NSManaged public var latitude_deg: String?
    @NSManaged public var local_code: String?
    @NSManaged public var longitude_deg: String?
    @NSManaged public var municipality: String?
    @NSManaged public var name: String?
    @NSManaged public var scheduled_service: String?
    @NSManaged public var type: String?
    @NSManaged public var wikipedia_link: String?

}

extension AirportEntity : Identifiable {

}
