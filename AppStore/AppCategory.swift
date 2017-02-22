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
    
    override func setValue(_ value: Any?, forKey key: String) {
        
    }
    
    static func fetchFeaturedApps(completion: @escaping ([AppCategory]) -> ()) {
        
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
                if let dictionary = json as? [String: AnyObject], let categoriesArray = dictionary["categories"] as? [[String: AnyObject]] {
                    
                    var appCategories = [AppCategory]()
                    for dict in categoriesArray {
                        let appCategory =  AppCategory.setAppCategoryFrom(dictionary: dict)
                        appCategories.append(appCategory)
                    }
                    
                    DispatchQueue.main.async {
                        completion(appCategories)
                    }
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
                print(app.name)
            }
        }
        return appCategory
    }
    
        
    
}
