//
//  CategoryCell.swift
//  AppStore
//
//  Created by James Rochabrun on 2/21/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

protocol CategoryCellDelegate: class {
    func showDetailOf(app: App)
}

//this is the one vertical
class CategoryCell: BaseCell {
    
    fileprivate let cellID = "cellID"
    weak var delegate: CategoryCellDelegate?
    
    var appCategory: AppCategory? {
        didSet {
            if let name = appCategory?.name  {
                titleLabel.text = name
            }
            DispatchQueue.main.async {
                self.appsCollectionView.reloadData()
            }
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.UI.h1FontSize
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.UI.h1Color
        return label
    }()
    
    lazy var appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        cv.alwaysBounceHorizontal = true
        cv.contentInset = UIEdgeInsetsMake(0, Constants.UI.padding, 0, Constants.UI.padding)
        cv.register(AppCell.self, forCellWithReuseIdentifier: self.cellID)
        return cv
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return  view
    }()
    
    override func setupViews() {
        addSubview(appsCollectionView)
        addSubview(titleLabel)
        addSubview(dividerLineView)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: Constants.UI.titleLabelHeight).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.padding).isActive = true
        
        appsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        appsCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        appsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        appsCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        dividerLineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0.5).isActive = true
        dividerLineView.heightAnchor.constraint(equalToConstant: Constants.UI.dividerLineHeight).isActive = true
        dividerLineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        dividerLineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    
    }
}

extension CategoryCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppCell
        if let app = appCategory?.apps?[indexPath.row] {
            cell.app = app
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategory?.apps?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.UI.appCellWidth, height: frame.height - Constants.UI.titleLabelHeight - Constants.UI.dividerLineHeight * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appCategory?.apps?[indexPath.row] {
            delegate?.showDetailOf(app: app)
        }
    }
}







