//
//  CategoryCell.swift
//  AppStore
//
//  Created by James Rochabrun on 2/21/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
    
    fileprivate let cellID = "cellID"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Fetaured apps"
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        setupViews()
    }
    
    func setupViews() {
        
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.UI.appCellWidth, height: frame.height - Constants.UI.titleLabelHeight - Constants.UI.dividerLineHeight * 2)
    }
}







