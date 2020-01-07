//
//  Help.swift
//  Bill
//
//  Created by shuai.wang on 2020/1/7.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    class func initWithStoryBoard(name: String) -> UIViewController {
        let sb = UIStoryboard(name: name, bundle: nil)
        return sb.instantiateInitialViewController()!
    }
}
