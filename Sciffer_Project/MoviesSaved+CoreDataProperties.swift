//
//  MoviesSaved+CoreDataProperties.swift
//  Sciffer_Project
//
//  Created by Sagar Bhosale on 23/05/22.
//
//

import Foundation
import CoreData


extension MoviesSaved {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesSaved> {
        return NSFetchRequest<MoviesSaved>(entityName: "MoviesSaved")
    }

    @NSManaged public var title: String?
    @NSManaged public var year: String?
    @NSManaged public var runtime: String?
    @NSManaged public var cast: String?

}

extension MoviesSaved : Identifiable {

}
