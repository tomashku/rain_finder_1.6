//
//  RunwayEntity+CoreDataProperties.swift
//  rain_finder_1.6
//
//  Created by Tomasz Zuczek on 28/06/2022.
//
//

import Foundation
import CoreData


extension RunwayEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RunwayEntity> {
        return NSFetchRequest<RunwayEntity>(entityName: "RunwayEntity")
    }

    @NSManaged public var airport_ident: String?
    @NSManaged public var airport_ref: String?
    @NSManaged public var he_displaced_threshold_ft: String?
    @NSManaged public var he_elevation_ft: String?
    @NSManaged public var he_heading_degT: String?
    @NSManaged public var he_ident: String?
    @NSManaged public var he_latitude_deg: String?
    @NSManaged public var he_longitude_deg: String?
    @NSManaged public var id: String?
    @NSManaged public var le_displaced_threshold_ft: String?
    @NSManaged public var le_elevation_ft: String?
    @NSManaged public var le_heading_degT: String?
    @NSManaged public var le_ident: String?
    @NSManaged public var le_latitude_deg: String?
    @NSManaged public var le_longitude_deg: String?
    @NSManaged public var length_ft: String?
    @NSManaged public var width_ft: String?

}

extension RunwayEntity : Identifiable {

}
