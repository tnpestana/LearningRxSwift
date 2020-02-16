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
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                break
            default:
                break
            }
        }
    }
}
