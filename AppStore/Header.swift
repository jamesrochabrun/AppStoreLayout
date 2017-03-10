//
//  Header.swift
//  AppStore
//
//  Created by James Rochabrun on 2/22/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class Header: CategoryCell {

    private let bannerCellID = "cellID"
    
    override func setupViews() {
        
        addSubview(appsCollectionView)
        appsCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        appsCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: bannerCellID)
        appsCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        appsCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        appsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        appsCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.UI.headerCellwidth, height: frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCellID, for: indexPath) as! AppCell
        if let app = appCategory?.apps?[indexPath.row] {
            cell.app = app
        }
       // cell.appImageview.backgroundColor = .yellow
        return cell
    }
    
    private class BannerCell: AppCell {
        
        override func setupViews() {
            addSubview(appImageview)
            appImageview.layer.cornerRadius = 0
            appImageview.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
            appImageview.layer.borderWidth = 0.5 
            appImageview.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            appImageview.topAnchor.constraint(equalTo: topAnchor).isActive = true
            appImageview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            appImageview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        }
    }
    
    
    
    
    
    
    
}
