//
//  AppCell.swift
//  AppStore
//
//  Created by James Rochabrun on 2/21/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit



class AppCell: BaseCell {
    
    var nameLabelheightAnchor: NSLayoutConstraint?
    
    var app: App? {
        didSet {
            priceLabel.text = ""
            nameLabel.text = ""
            categoryLabel.text = ""
            
            if let name = app?.name {
                nameLabel.text = name
                let rect = NSString(string: name).boundingRect(with:  CGSize(width: frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName:  Constants.UI.h2FontSize], context: nil)
                if rect.height > Constants.UI.nameLabelHeight {
                    nameLabelheightAnchor?.isActive = false
                    nameLabelheightAnchor = nameLabel.heightAnchor.constraint(equalToConstant: Constants.UI.nameLabelHeight * 2)
                    nameLabelheightAnchor?.isActive = true
                }
            }
            if let category = app?.category {
                categoryLabel.text = category
            }
            if let price = app?.price {
                priceLabel.text = "$\(price)"
            }
            if let imageName = app?.imageName {
                appImageview.image = UIImage(named: imageName)
            }
        }
    }
    
    let appImageview: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.UI.h2FontSize
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.UI.h1Color
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.UI.h3FontSize
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.UI.h2Color
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.UI.h3FontSize
        label.numberOfLines = 2
        label.textColor = Constants.UI.h2Color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        
        addSubview(appImageview)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        appImageview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        appImageview.heightAnchor.constraint(equalToConstant: frame.width).isActive = true
        appImageview.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        appImageview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: appImageview.bottomAnchor, constant: 2).isActive = true
        nameLabelheightAnchor = nameLabel.heightAnchor.constraint(equalToConstant: Constants.UI.nameLabelHeight)
        nameLabelheightAnchor?.isActive = true
        
        categoryLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: Constants.UI.categoryLabelHeight).isActive = true
        
        priceLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 2).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: Constants.UI.priceLabelHeight).isActive = true
        
    }
    
}

