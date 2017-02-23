//
//  AppDetailDescriptionCell.swift
//  AppStore
//
//  Created by James Rochabrun on 2/23/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class AppDetailDescriptionCell: BaseCell {
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return  view
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(textView)
        addSubview(dividerLineView)
        textView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.UI.vPaddingDescTv).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.UI.vPaddingDescTv).isActive = true
        textView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.hPaddingDescTv).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.hPaddingDescTv).isActive = true
        
        dividerLineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.UI.dividerLineHeight).isActive = true
        dividerLineView.heightAnchor.constraint(equalToConstant: Constants.UI.dividerLineHeight).isActive = true
        dividerLineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        dividerLineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}




