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
    
    @IBOutlet weak var tradeNumber: UITextField!
    @IBOutlet weak var businessNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avoidKeyBoard()
        setBackButton()
    }
    
    private func setBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target: self, action: #selector(popBack))
    }
    
    private func avoidKeyBoard() {
        KeyboardAvoiding.avoidingView = view
        KeyboardAvoiding.paddingForCurrentAvoidingView = -200
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: Obc function
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
