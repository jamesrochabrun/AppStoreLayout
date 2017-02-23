//
//  AppCategory.swift
//  AppStore
//
//  Created by James Rochabrun on 2/21/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class AppCategory: NSObject {

    var name: String?
    var apps: [App]?
    
    static func fetchFeaturedApps(completion: @escaping (FeaturedApps) -> ()) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        guard let url = URL(string: urlString) else {
            print("URL NOT CONVERTED")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("ERROR FETCHING JSON: ", error ?? "error")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                let featuredApps = FeaturedApps.featuredappsFrom(dictionary: json as! [String: AnyObject])
                DispatchQueue.main.async {
                    completion(featuredApps)
                }
            } catch let error {
                print("SERIALIZATION ERROR:" , error)
            }
            }.resume()
    }
    
    static func setAppCategoryFrom(dictionary: [String: AnyObject]) -> AppCategory {
    
        let appCategory = AppCategory()
        appCategory.name = dictionary["name"] as? String
        if let appsDictArray = dictionary["apps"] as? [[String: AnyObject]] {
            appCategory.apps = [App]()
            for dict in appsDictArray {
                let app = App.setAppFrom(dictionary: dict)
                appCategory.apps?.append(app)
            }
        }
        return appCategory
    }
    
        
    
}
