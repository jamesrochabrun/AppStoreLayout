//
//  Constants.swift
//  AppStore
//
//  Created by James Rochabrun on 2/21/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct UI {
        static let titleLabelHeight: CGFloat = 40
        static let nameLabelHeight: CGFloat = 20
        static let categoryLabelHeight: CGFloat = 15
        static let dividerLineHeight: CGFloat = 0.5
        static let padding: CGFloat = 14
        static let priceLabelHeight: CGFloat = 20
        static let appCellWidth: CGFloat = 100
        static let largeAppCellWidth: CGFloat = 200
        static let appCellHeight: CGFloat = 230
        static let largeAppCellHeight: CGFloat = 160
        static let headerHeight: CGFloat = 125
        static let headerCellwidth = (UIApplication.shared.keyWindow?.frame.width)! / 2 + 50
        static let screenshotCellHeight: CGFloat = 200
        static let appDetailHeaderHeight: CGFloat = 170
        static let h1Color: UIColor = UIColor.darkGray
        static let h2Color: UIColor = UIColor.lightGray
        static let h1FontSize: UIFont = UIFont.systemFont(ofSize: 18)
        static let h2FontSize: UIFont = UIFont.systemFont(ofSize: 16)
        static let h3FontSize: UIFont = UIFont.systemFont(ofSize: 14)
        static let defaultBlueColor: UIColor = UIColor(red: 0, green: 199/255, blue: 250/255, alpha: 1)
        static let vPaddingDescTv: CGFloat = 4
        static let hPaddingDescTv: CGFloat = 8
    }
    
}
