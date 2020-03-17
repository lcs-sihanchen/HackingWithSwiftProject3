//
//  DetailViewController.swift
//  HackingWithSwiftProject1
//
//  Created by Chen, Sihan on 2020-03-14.
//  Copyright © 2020 Chen, Sihan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    // Stored Properties
    var selectedImage: String?
    
    var totalNumber: Int?
    
    var ofWhichPicture: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Give it a default value to get rid of "Optional"
        title = "Picture \(ofWhichPicture ?? "1") of \(totalNumber ?? 10)"
        
        // When the right navigation button is tapped, trigger shareTapped Method
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .action, target: self,
                            action: #selector(shareTapped))
        // Do any additional setup after loading the view.
        
        // Never displays a large title
        navigationItem.largeTitleDisplayMode = .never
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            
        }
    }
    
    // Appear when view is on
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    // Disappear when view is hidden
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // Function is available to Objective-C language
    @objc func shareTapped() {
        
        // Convert image into jpeg data, with a specified quality of 0.8
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            
            // If there is no image, print this:
            print("No image found")
            return
                
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        // This line of code only works on Ipad, if it's iphone, it will be ignored
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
