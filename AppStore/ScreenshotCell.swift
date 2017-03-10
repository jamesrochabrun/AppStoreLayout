//
//  ScreenshotCell.swift
//  AppStore
//
//  Created by James Rochabrun on 2/23/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ScreenshotCell: BaseCell {
    
    fileprivate let cellID = "cellID"
    var app: App? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        cv.contentInset = UIEdgeInsetsMake(0, Constants.UI.padding, 0, Constants.UI.padding)
        cv.alwaysBounceHorizontal = true
        cv.register(ScreenShotContentCell.self, forCellWithReuseIdentifier: self.cellID)
        return cv
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return  view
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(collectionView)
        addSubview(dividerLineView)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        dividerLineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0.5).isActive = true
        dividerLineView.heightAnchor.constraint(equalToConstant: Constants.UI.dividerLineHeight).isActive = true
        dividerLineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        dividerLineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}

extension ScreenshotCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath) as! ScreenShotContentCell
        if let imageName = app?.screenShots?[indexPath.row] {
            cell.imageview.image = UIImage(named: imageName)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = app?.screenShots?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.UI.headerCellwidth, height: frame.height - Constants.UI.padding * 2)
        
    }

    fileprivate class ScreenShotContentCell: BaseCell {
        
        let imageview: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFill
            iv.backgroundColor = .clear
            iv.clipsToBounds = true
            return iv
        }()
        
        
        fileprivate override func setupViews() {
            super.setupViews()
            addSubview(imageview)
            imageview.topAnchor.constraint(equalTo: topAnchor).isActive = true
            imageview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            imageview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            imageview.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        }
    }
}








