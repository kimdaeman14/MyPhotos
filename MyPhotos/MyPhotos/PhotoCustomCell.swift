//
//  PhotoCustomCell.swift
//  MyPhotos
//
//  Created by kimdaeman14 on 2018. 8. 3..
//  Copyright © 2018년 GoldenShoe. All rights reserved.
//

import UIKit
import Photos

class PhotoCustomCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView:UIImageView!
    var fetchResult: PHFetchResult<PHAsset>!
    var asset: PHAsset!
    let imageManager: PHCachingImageManager = PHCachingImageManager() //얘로이미지요청


    func aaa(){
        
    // FIXME: - 옵셔널바인딩안되서 터진다고함. 고쳐야해. 일단보류.
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil) { image, _ in
        self.imageView.image = image
        }
    }
    
    func requestCollection(){
        
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.smartAlbum, subtype: PHAssetCollectionSubtype.smartAlbumUserLibrary, options: nil) //iphone 카메라롤 그거를 선언했고.
        
        guard let cameraRollCollection = cameraRoll.firstObject else {return} //안비어있으면 내려가
        
        let fetchOption = PHFetchOptions() //최신순으로 정렬하고
        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        //그결과를 fetchResult에 저장
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOption)
        
    }
}
