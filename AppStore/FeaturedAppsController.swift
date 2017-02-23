//
//  ViewController.swift
//  AppStore
//
//  Created by James Rochabrun on 2/21/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController {
    
    private let cellID = "cellID"
    private let largeCellID = "largeCellID"
    private let headerID = "headerID"
    var appCategories: [AppCategory]?
    var featuredApps: FeaturedApps?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppCategory.fetchFeaturedApps { (featuredApps) in
            self.featuredApps = featuredApps
            self.appCategories = featuredApps.appCategories
            self.collectionView?.reloadData()
        }
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellID)
        collectionView?.register(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellID, for: indexPath) as! LargeCategoryCell
            cell.appCategory = appCategories?[indexPath.row]
            cell.delegate = self
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoryCell
        cell.appCategory = appCategories?[indexPath.row]
        cell.delegate = self
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! Header
        header.appCategory = featuredApps?.bannerCategory
        return header
    }
    

}

extension FeaturedAppsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: Constants.UI.largeAppCellHeight)
        }
        
        return CGSize(width: view.frame.width, height: Constants.UI.appCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: Constants.UI.headerHeight)
    }
}

extension FeaturedAppsController: CategoryCellDelegate {
    
    func showDetailOf(app: App) {
        let layout = UICollectionViewFlowLayout()
        let appDetailController = DetailViewController(collectionViewLayout: layout)
        appDetailController.app = app
        navigationController?.pushViewController(appDetailController, animated: true)
    }
}






