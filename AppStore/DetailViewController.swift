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
private let screeenShotID = "screeenShotID"
private let appDetailCellDescriptionID = "appDetailCellDescriptionID"

class DetailViewController: UICollectionViewController {
    
    var app: App? {
        didSet {
            navigationItem.title = app?.name
            if app?.screenShots != nil {
                return
            }
            if let id = app?.id {
                ServiceAPI.sharedInstance.fetchAppDetailInformation(withAppID: id, completion: { (app) in
                    //setting the app with new data "overriding app values"
                    self.app = app
                    self.collectionView?.reloadData()
                })
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView?.register(ScreenshotCell.self, forCellWithReuseIdentifier: screeenShotID)
        collectionView?.register(AppDetailDescriptionCell.self, forCellWithReuseIdentifier: appDetailCellDescriptionID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! AppDetailHeader
        header.app = self.app
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screeenShotID, for: indexPath) as! ScreenshotCell
            cell.app = self.app
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: appDetailCellDescriptionID, for: indexPath) as! AppDetailDescriptionCell
        cell.textView.attributedText = descriptionAttributedtext()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: Constants.UI.appDetailHeaderHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 1 {
          return sizeFromAttributedText()
        }
        
        return CGSize(width: view.frame.width, height: Constants.UI.screenshotCellHeight)
    }
    
    fileprivate func descriptionAttributedtext() -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString(string: "Description\n", attributes: [NSFontAttributeName: Constants.UI.h2FontSize])
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let range = NSMakeRange(0, attributedText.string.characters.count)
        attributedText.addAttribute(NSParagraphStyleAttributeName, value: style, range: range)
        
        if let description = app?.desc {
            attributedText.append(NSAttributedString(string: description, attributes: [NSFontAttributeName: Constants.UI.h3FontSize, NSForegroundColorAttributeName: UIColor.darkGray]))
        }
        return attributedText
    }
    
    fileprivate func sizeFromAttributedText() -> CGSize {
        
        let size = CGSize(width: view.frame.width - Constants.UI.hPaddingDescTv * 2, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin)
        let rect = descriptionAttributedtext().boundingRect(with: size, options: options, context: nil)
        return  CGSize(width: view.frame.width, height: rect.height + 30)
    }
    
    
    
    
    
    
    
}
