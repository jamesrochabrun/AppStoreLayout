//
//  AppCell.swift
//  AppStore
//
//  Created by James Rochabrun on 2/21/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let name = app?.name, let category = app?.category, let price = app?.price, let imageName = app?.imageName {
                nameLabel.text = name
                categoryLabel.text = category
                priceLabel.text = "$\(price)"
                appImageview.image = UIImage(named: imageName)
            } else {
                priceLabel.text = ""
            }
        }
    }
    
    let appImageview: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .red
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "tipaapp"
        label.font = Constants.UI.h2FontSize
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.UI.h1Color
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Entertainment"
        label.font = Constants.UI.h3FontSize
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.UI.h2Color
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "0.99 USD$"
        label.font = Constants.UI.h3FontSize
        label.numberOfLines = 2
        label.textColor = Constants.UI.h2Color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(appImageview)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        setupViews()
    }
    
    func setupViews() {
        
        appImageview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        appImageview.heightAnchor.constraint(equalToConstant: frame.width).isActive = true
        appImageview.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        appImageview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: appImageview.bottomAnchor, constant: 2).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constants.UI.nameLabelHeight).isActive = true
        
        categoryLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: Constants.UI.categoryLabelHeight).isActive = true
        
        priceLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 2).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: Constants.UI.priceLabelHeight).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

