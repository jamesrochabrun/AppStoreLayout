//
//  AppCategory.swift
//  AppStore
//
//  Created by James Rochabr/devun on 2/21/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class AppCategory: NSObject {

    var name: String?
    var apps: [App]?
    
    static func setAppCategoryFrom(dictionary: [String: AnyObject]) -> AppCategory {
    
        let appCategory = AppCategory()
        appCategory.name = dictionary["name"] as? String
        if let appsDictArray = dictionary["apps"] as? [[String: AnyObject]] {
//            appCategory.apps = [App]()
//            for dict in appsDictArray {
//                let app = App.setAppFrom(dictionary: dict)
//                appCategory.apps?.append(app)
//            }
            appCategory.apps = appsDictArray.map{App.setAppFrom(dictionary: $0)}
        }
        return appCategory
    }
    
        
    
}
