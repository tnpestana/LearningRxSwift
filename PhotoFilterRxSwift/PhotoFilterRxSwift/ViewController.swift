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
    @IBOutlet weak var btnApplyFiler: UIButton!
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
            DispatchQueue.main.async {
                self?.updateUI(with: photo)
            }
        }).disposed(by: disposeBag)
    }
    
    private func updateUI(with photo: UIImage) {
        imgPhoto.image = photo
        btnApplyFiler.isHidden = false
    }
    
    @IBAction func btnApplyFilterTapped() {
        guard let sourceImg = self.imgPhoto.image else {
            return
        }
        FilterService.applyFilter(to: sourceImg).subscribe(onNext: { outputImg in
            DispatchQueue.main.async {
                self.imgPhoto.image = outputImg
            }
            }).disposed(by: disposeBag)
        
//        FilterService().applyFilter(to: sourceImg) { (outputImg) in
//            DispatchQueue.main.async {
//                self.imgPhoto.image = outputImg
//            }
//        }
    }
}

