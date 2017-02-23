//
//  AppDetailHeader.swift
//  AppStore
//
//  Created by James Rochabrun on 2/22/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class AppDetailHeader: BaseCell {
    
    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                appImageview.image = UIImage(named: imageName)
            }
            if let name = app?.name {
                nameLabel.text = name
            }
            if let price = app?.price {
                buyButton.setTitle("$\(price)", for: .normal)
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
    
    let segmentedControll: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["details", "reviews", "related"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.darkGray
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.UI.h1FontSize
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.UI.h1Color
        return label
    }()
    
    let buyButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("BUY", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.borderColor = Constants.UI.defaultBlueColor.cgColor
        b.layer.borderWidth = 1
        b.layer.cornerRadius = 5
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        return b
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return  view
    }()
    
    override func setupViews() {
        addSubview(appImageview)
        addSubview(segmentedControll)
        addSubview(nameLabel)
        addSubview(buyButton)
        addSubview(dividerLineView)
        
        appImageview.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        appImageview.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        appImageview.widthAnchor.constraint(equalToConstant: 100).isActive = true
        appImageview.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        segmentedControll.heightAnchor.constraint(equalToConstant: 34).isActive = true
        segmentedControll.topAnchor.constraint(equalTo: appImageview.bottomAnchor, constant: 8).isActive = true
        segmentedControll.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        segmentedControll.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: appImageview.rightAnchor, constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: appImageview.topAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constants.UI.nameLabelHeight).isActive = true
        
        buyButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buyButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: segmentedControll.topAnchor, constant: -14).isActive = true
        
        dividerLineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.UI.dividerLineHeight).isActive = true
        dividerLineView.heightAnchor.constraint(equalToConstant: Constants.UI.dividerLineHeight).isActive = true
        dividerLineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        dividerLineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }

}
















