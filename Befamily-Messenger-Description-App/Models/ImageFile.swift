//
//  ImageFile+CoreDataProperties.swift
//
//
//  Created by 임성민 on 2022/11/13.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(ImageFile)
class ImageFile: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageFile> {
        return NSFetchRequest<ImageFile>(entityName: "ImageFile")
    }

    @NSManaged public var content: UIImage?
    @NSManaged public var url: String?
}

extension ImageFile : Identifiable {

}
