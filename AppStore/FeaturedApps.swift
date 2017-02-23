//
//  FeaturedApps.swift
//  AppStore
//
//  Created by James Rochabrun on 2/22/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class FeaturedApps: NSObject {
    
    var bannerCategory: AppCategory?
    var appCategories: [AppCategory]?
    
    static func featuredappsFrom(dictionary: [String: AnyObject]) -> FeaturedApps {
        
        let featuredApps = FeaturedApps()
        if let bannerCategoryDictionary = dictionary["bannerCategory"] as? [String: AnyObject] {
            featuredApps.bannerCategory = AppCategory.setAppCategoryFrom(dictionary: bannerCategoryDictionary)
        }
        if let categoriesArray = dictionary["categories"] as? [[String: AnyObject]] {
//            var appCategories = [AppCategory]()
//            for dict in categoriesArray {
//                let appCategory = AppCategory.setAppCategoryFrom(dictionary: dict)
//                appCategories.append(appCategory)
//            }
//            featuredApps.appCategories = appCategories
            featuredApps.appCategories = categoriesArray.map{AppCategory.setAppCategoryFrom(dictionary: $0)}
        }
        return featuredApps
    }
}
