//
//  Service.swift
//  AppStore
//
//  Created by James Rochabrun on 2/22/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation


struct ServiceAPI {
    
    static let sharedInstance = ServiceAPI()
    
     func fetchFeaturedApps(completion: @escaping (FeaturedApps) -> ()) {
        
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
    
    func fetchAppDetailInformation(withAppID appID: NSNumber, completion: @escaping (App) -> ()) {
        
        if let urlString = URL(string: "http://www.statsallday.com/appstore/appdetail?id=\(appID)") {
        URLSession.shared.dataTask(with: urlString, completionHandler: { (data, response, error) in
            if error != nil {
                print("ERROR LOADING APP DETAILS")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                if let dictionary = json as? [String: AnyObject] {
                    
                    let app = App.setAppFrom(dictionary: dictionary)
                    DispatchQueue.main.async {
                        completion(app)
                    }
                }
            } catch let error {
                print("SERIALIZATION ERROR FETCHIN APP DETAIL:" , error)
            }
        }).resume()
        }
    }
}







