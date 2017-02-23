//
//  DetailViewController.swift
//  AppStore
//
//  Created by James Rochabrun on 2/22/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let headerID = "headerID"

class DetailViewController: UICollectionViewController {
    
    var app: App? {
        didSet {
            navigationItem.title = app?.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! AppDetailHeader
        header.app = self.app
        return header
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: Constants.UI.appDetailHeaderHeight)
    }
    
    
    
    
    
}
