//
//  LogoGallery.swift
//  Bill
//
//  Created by shuai.wang on 2020/1/8.
//  Copyright © 2020 Thoughtworks. All rights reserved.
//

import Foundation
import UIKit

@objc protocol GalleryDelegate {
    @objc optional func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, logo: UIImage)
}

class LogoGallery: UIViewController {
    
    let margin: CGFloat = 10
    let itemWidth: CGFloat = ScreenWidth / 4
    
    weak var delegate:GalleryDelegate?
    lazy var datas = ImageManager.loadLogos()
    
    override func viewDidLoad() {
        setUpCollectionView()
    }
    
    
    //MARK: CollectionView
    fileprivate func setUpCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = margin
        layout.minimumInteritemSpacing = margin
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        let logoGalley = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        logoGalley.delegate = self
        logoGalley.dataSource = self
        logoGalley.register(UINib.init(nibName: "LogoCell", bundle: nil), forCellWithReuseIdentifier: "logoCell")
        logoGalley.backgroundColor = UIColor.groupTableViewBackground
        view.addSubview(logoGalley)
        
    }
    
}

extension LogoGallery: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "logoCell", for: indexPath) as! LogoCell
        cell.logo.image = datas[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.collectionView?(collectionView, didSelectItemAt: indexPath, logo: datas[indexPath.row])
        dismiss(animated: true)
    }
}
