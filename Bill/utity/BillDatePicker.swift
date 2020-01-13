//
//  BillDatePicker.swift
//  Bill
//
//  Created by shuai.wang on 2020/1/13.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation
import UIKit

/// DatePicker
protocol BillPickerDelegate: NSObject {
    
    func didFinishPickeDate(picker: BillDatePicker, date: String)
}

class BillDatePicker: UIDatePicker {
    
    typealias  Block = (_ str: String) -> Void
    
    var delegate: BillPickerDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        datePickerMode = .dateAndTime
        addTarget(self, action: #selector(datePickerEnd(picker:)), for: .valueChanged)
    }

    
    @objc fileprivate func datePickerEnd(picker: BillDatePicker) {
        let date = BillDateFormatter.formatDate(date: picker.date, model: .dateAndTime)
        delegate?.didFinishPickeDate(picker: picker, date: date)
    }
    
}
