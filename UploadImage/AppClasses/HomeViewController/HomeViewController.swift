//
//  ViewController.swift
//  UploadImage
//
//  Created by Aniket Gorhe on 12/04/19.
//  Copyright © 2019 Aniket Gorhe. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {

    @IBOutlet weak var progerssView: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "waterfall")

        UploadManager.shared.uploadImage(image: image!) { (info, error, progress) in
            
            if progress != nil{
                self.progerssView.progress = Float((progress?.fractionCompleted)!)
            }
            
            if info != nil {
                print(info?.url)
                DispatchQueue.main.async(execute: {
                    self.imageView.sd_setShowActivityIndicatorView(true)
                    self.imageView.sd_setIndicatorStyle(.gray)
                    self.imageView.sd_setImage(with: URL(string: info!.url!), placeholderImage: UIImage(named: ""))
                });
                
            }else{
                print(error)
            }
        }
    }

}

