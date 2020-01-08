//
//  WechatViewController.swift
//  Bill
//
//  Created by shuai.wang on 2020/1/7.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class WechatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        KeyboardAvoiding.avoidingView = view
        
//        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"), style: .done, target: self, action: #selector(popBack))
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: Obc function
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
