//
//  PhotosCollectionViewController.swift
//  PhotoFilterRxSwift
//
//  Created by Tiago Pestana on 16/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import Foundation
import UIKit
import Photos

class PhotosCollectionViewController: UICollectionViewController {
    private var images = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization { [weak self] (status) in
            switch status {
            case .authorized:
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                assets.enumerateObjects { (object, count, stop) in
                    self?.images.append(object)
                }
                self?.images.reverse()
                self?.collectionView.reloadData()
            default:
                break
            }
        }
    }
}
