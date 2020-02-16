//
//  FilterService.swift
//  PhotoFilterRxSwift
//
//  Created by Tiago Pestana on 16/02/2020.
//  Copyright © 2020 Tiago Pestana. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

class FilterService {
    private var context = CIContext()
    
    func applyFilter(to inputImg: UIImage, completion: @escaping (UIImage) -> ()) {
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(5.0, forKey: kCIInputWidthKey)
        if let sourceImg = CIImage(image: inputImg) {
            filter.setValue(sourceImg, forKey: kCIInputImageKey)
            if let cgImg = self.context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
                let processedImg = UIImage(cgImage: cgImg, scale: inputImg.scale, orientation: inputImg.imageOrientation)
                completion(processedImg)
            }
        }
    }
}
