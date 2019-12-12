//
//  Shadow.swift
//  Platzi Finanzas
//
//  Created by David Yepes Buitrago on 12/10/19.
//  Copyright © 2019 David Yepes Buitrago. All rights reserved.
//

import UIKit

extension UIView {
    var borderUIColor: UIColor {
        get {
            guard let color = layer.borderColor else{
                return UIColor.black
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
}
