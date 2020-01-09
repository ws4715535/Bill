//
//  ViewController.swift
//  Bill
//
//  Created by shuai.wang on 2020/1/7.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var rows: [UITableViewCell] = [
        buildCell(name: "微信支付"),
        buildCell(name: "支付宝支付(个人转账)"),
        buildCell(name: "支付宝支付(淘宝购物)"),
        buildCell(name: "支付宝支付(商家)"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    private func setUpTableView() {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //MARK: TableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return rows[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let wechat = WechatViewController.initStoryBoardWithInitialController(name: "WechatViewController")
            navigationController?.pushViewController(wechat, animated: true)
        case 1,2,3:
            let aliPay = AlipayViewController.initStoryBoardWithInitialController(name: "AlipayViewController")
            navigationController?.pushViewController(aliPay, animated: true)
        default:
            return
        }
    }


    //MARK: private function
    fileprivate func buildCell(name: String) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = name
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}

