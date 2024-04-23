//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Fakiya Imangaliyeva on 4/1/24.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    var post: Post!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Display the post details
            if let photo = post.photos.first {
                let url = photo.originalSize.url
                Nuke.loadImage(with: url, into: imageView)
                
                
                
            }
        }
    }
