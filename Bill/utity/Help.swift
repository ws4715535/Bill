//
//  Help.swift
//  Bill
//
//  Created by shuai.wang on 2020/1/7.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation
import UIKit

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height
let logoCount = 16

extension UIViewController {
    class func initStoryBoardWithInitialController(name: String) -> UIViewController {
        let sb = UIStoryboard(name: name, bundle: nil)
        return sb.instantiateInitialViewController()!
    }
    
    class func initStoryBoardWithIdentifier(name: String, identifier: String) -> UIViewController {
        let sb = UIStoryboard(name: name, bundle: nil)
        sb.instantiateViewController(withIdentifier: identifier)
        return sb.instantiateInitialViewController()!
    }
}

/// ImageManager
class ImageManager {
        
    class func loadLogos() -> [UIImage] {
        var imgs = [UIImage]()
        for i in 0...logoCount {
            if let logo = UIImage(named: "logo\(i)")  {
                imgs.append(logo)
            }
        }
        return imgs
    }
        
}

class BillDateFormatter {
    
    public enum Model: String {
        
        
        case dateAndTime = "YYYY-MM-DD HH:mm:ss"
        
        case date  = "YYYY-MM-DD"
        
        case time = "HH:mm:ss"
            
    }
    
    public class func formatDate(date: Date, model: Model) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = model.rawValue
        let dateString = formatter.string(from: date)
        return dateString
        
    }
    
}
