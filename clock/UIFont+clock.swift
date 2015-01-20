//
//  UIFont+clock.swift
//  clock
//
//  Created by Steven Lu on 10/2/14.
//  Copyright (c) 2014 Steven Lu. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {

    class func primaryFontWithSize(size: CGFloat) -> UIFont? {
        return self(name: "ProximaNova-Reg", size: size)
    }

    class func primaryFontLightWithSize(size: CGFloat) -> UIFont? {
        return self(name: "ProximaNova-Light", size: size)
    }

}
