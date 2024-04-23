//
//  ViewController.swift
//  ios101-project6-tumblr
//

import UIKit
import Nuke

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Class content
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = [
        Post(summary: "STEP GOOGLE", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20220720121505/google2.jpg")!))], caption: "It is STEP Internship"),
        Post(summary: "Breakthrough Collaborative", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://static.wixstatic.com/media/3c017e_c059fdbbdb5b46b0873e0a0f8d67e472~mv2.jpg/v1/fill/w_560,h_322,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/breakthroughcollaborativelogo.jpg")!))], caption: "Caption for first post"),
        Post(summary: "Code2040", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://revisionpath.com/wp-content/uploads/2014/08/code2040.jpg")!))], caption: "Caption for first post"),
        Post(summary: "Credit Suise", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://miro.medium.com/v2/resize:fit:1080/1*2KkSjV-EXNNJeqTXJ-8KzQ.jpeg")!))], caption: "Caption for first post"),
        Post(summary: "Deloitte", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://mma.prnewswire.com/media/379251/Deloitte_Logo.jpg?p=facebook")!))], caption: "Caption for first post"),
        Post(summary: "MLH Fellowship", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://opportunitiesforyouth.org/wp-content/uploads/2024/03/Screenshot-2024-03-22-alle-14.15.56-1077x640.png")!))], caption: "Caption for first post"),
        Post(summary: "UBER Star", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://pbs.twimg.com/profile_images/1045783102000230400/TPLLaqYR_400x400.jpg")!))], caption: "Caption for first post"),
        Post(summary: "Whirlpool", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://play-lh.googleusercontent.com/xyjHBVaZ7sY8n4MFUIEHKXfjpwaVkXWDVlydxaOI0luXnIXWW3yDwbOROEE2H7VuDqY")!))], caption: "Caption for first post"),
        Post(summary: "The New Technologists", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://images.anandtech.com/doci/7143/MSFT_logo_png_678x452.png")!))], caption: "Caption for first post"),
        Post(summary: "Thrive Capital Summer Fellowship", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://framerusercontent.com/images/HFdWFj5Gw1q4x5TW9Nn8q2jfBK0.png")!))], caption: "Caption for first post"),
        Post(summary: "FutureForce Tech LaunchPad", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://mma.prnewswire.com/media/1800392/codepath_1x1_solid_dark_Logo.jpg?p=twitter")!))], caption: "Caption for first post"),
        Post(summary: "National Student leadership Conference (NSLC) ", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP5dCigZM1yuKteG9aPqmGGqBTsdXpwLncRrO4c551ng&s")!))], caption: "Caption for first post"),
        Post(summary: "HeadStart", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://media.licdn.com/dms/image/C560BAQHHZl4n-BVOqg/company-logo_200_200/0/1630566999262/california_head_start_association_logo?e=2147483647&v=beta&t=cg-z1VMwao7qiGt-5W_3264YqhfQpiUO7evzv5nfZ74")!))], caption: "Caption for first post"),
        Post(summary: "State Farm", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://www.insurancejournal.com/app/uploads/2023/10/State-Farm-Logo.png")!))], caption: "Caption for first post"),
        Post(summary: "Morgan Stanley", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://nonprofitresourcehub.org/wp-content/uploads/2020/09/morgan-stanley-logo.jpg")!))], caption: "Caption for first post"),
        Post(summary: "YYGS Instructor Internship", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTemZjvW2ageVrG3g157y5yqExqn4Pg6wovcDkldkTCGw&s")!))], caption: "Caption for first post"),
        Post(summary: "ID Tech", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://www.internationalschool.la/wp-content/uploads/2020/04/idtech-logo-300x300.png")!))], caption: "Caption for first post"),
        Post(summary: "Lavner Education", photos: [Photo(originalSize: PhotoSize(url: URL(string: "https://images.activityhero.com/59374/original/583f0a61-1256-49ac-9003-01c22fc3376f.png")!))], caption: "Caption for first post"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        let post = posts[indexPath.row]
        cell.summaryLabel.text = post.summary
        if let photo = post.photos.first {
            let url = photo.originalSize.url
            Nuke.loadImage(with: url, into: cell.postImageView)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: post)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail", let detailVC = segue.destination as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                detailVC.post = posts[indexPath.row]
            }
            
            
        }
    }
} 
