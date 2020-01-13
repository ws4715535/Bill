//
//  WechatViewController.swift
//  Bill
//
//  Created by shuai.wang on 2020/1/7.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding
import YPImagePicker

class WechatViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var tradeNumber: UITextField!
    @IBOutlet weak var businessNumber: UITextField!
    @IBOutlet weak var time: UITextField!
    
    override func viewDidLoad() {
        initLogo()
        avoidKeyBoard()
        setBackButton()
        changeLogo()
        setDatePicker()
    }
    
    private func setDatePicker() {
        
        let picker = BillDatePicker()
        picker.delegate = self
        time.inputView = picker
        
    }
    
    private func initLogo() {
        logo.isUserInteractionEnabled = true
        logo.layer.cornerRadius = 31
        logo.clipsToBounds = true
    }
    
    private func setBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target: self, action: #selector(popBack))
    }
    
    private func avoidKeyBoard() {
        KeyboardAvoiding.avoidingView = view
        KeyboardAvoiding.paddingForCurrentAvoidingView = -200
    }
    
    private func changeLogo() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLogo))
        logo.addGestureRecognizer(tap)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //MARK: Obc function
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapLogo() {
        let photoSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let photo = UIAlertAction(title: "相册", style: .default) { (action) in
            var config = YPImagePickerConfiguration()
            config.screens = [.library]
            config.showsPhotoFilters = false
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker] items, _ in
                if let photo = items.singlePhoto {
                    self.logo.image = photo.image
                }
                picker.dismiss(animated: true, completion: nil)
            }
            self.present(picker, animated: true, completion: nil)
        }
        let camera = UIAlertAction(title: "拍照", style: .default) { (action) in
            var config = YPImagePickerConfiguration()
            config.screens = [.photo]
            config.showsPhotoFilters = false
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker] items, _ in
                if let photo = items.singlePhoto {
                    self.logo.image = photo.image
                }
                picker.dismiss(animated: true, completion: nil)
            }
            self.present(picker, animated: true, completion: nil)
        }
        
        let fantasy = UIAlertAction(title: "🚀", style: .default) { (action) in
            let logoGallery = LogoGallery()
            logoGallery.delegate = self
            let navi = UINavigationController(rootViewController: logoGallery)
            self.present(navi, animated: true)
        }
        
        let cancle = UIAlertAction(title: "取消", style: .cancel)
        photoSheet.addAction(photo)
        photoSheet.addAction(camera)
        photoSheet.addAction(fantasy)
        photoSheet.addAction(cancle)
        present(photoSheet, animated: true)
        
    }
}

extension WechatViewController: GalleryDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, logo: UIImage) {
        self.logo.image = logo
    }
}


extension WechatViewController: BillPickerDelegate {
    
    func didFinishPickeDate(picker: BillDatePicker, date: String) {
        time.text = date
    }
    
}
