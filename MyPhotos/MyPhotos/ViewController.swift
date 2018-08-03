//
//  ViewController.swift
//  MyPhotos
//
//  Created by kimdaeman14 on 2018. 8. 3..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
    let cellIdentifier: String = "cell"
    let photocustomcell = PhotoCustomCell()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        photocustomcell.requestCollection()
        photocustomcell.aaa()
        
       

        
    }
}



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
        
        return cell
    }
    
    
    
    
    
}
