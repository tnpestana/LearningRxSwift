//
//  ViewController.swift
//  PhotoFilterRxSwift
//
//  Created by Tiago Pestana on 16/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var imgPhoto: UIImageView!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let nav = segue.destination as? UINavigationController,
            let photosCVC = nav.viewControllers.first as? PhotosCollectionViewController
        else {
            return
        }
        
        photosCVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            self?.imgPhoto.image = photo
        }).disposed(by: disposeBag)
    }
}

