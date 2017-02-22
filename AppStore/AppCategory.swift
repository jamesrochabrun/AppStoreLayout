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
    
     static func fetchFeaturedApps() {
        
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
                if let dictionary = json as? [String: AnyObject], let categoriesArray = dictionary["categories"] as? [Dictionary] {
                    
///START FROM HERE
                    
                    
                }
            } catch let error {
                print("SERIALIZATION ERROR:" , error)
            }
        }.resume()
    }
    
    
    static func sampleAppsCategories() -> [AppCategory] {
        
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "Best new Apps"
        var bestNewApps = [App]()
        
        let tinderApp = App()
        tinderApp.name = "tinder"
        tinderApp.imageName = "tipIcon"
        tinderApp.category = "Entertainment"
        tinderApp.price = NSNumber(floatLiteral: 2.99)
        
        bestNewApps.append(tinderApp)
        bestNewAppsCategory.apps = bestNewApps
        
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "Best new Games"
        var bestNewGameApps = [App]()
        
        let instagram = App()
        instagram.name = "instagram"
        instagram.imageName = "tipIcon"
        instagram.category = "Entertainment"
        instagram.price = NSNumber(floatLiteral: 2.99)
        
        bestNewGameApps.append(instagram)
        bestNewGamesCategory.apps = bestNewGameApps
        
        
        return [bestNewAppsCategory, bestNewGamesCategory]
        
    }
    
    
    
    
}
