//
//  DetailViewController.swift
//  Student500775964
//
//  Created by Wouter Kloos on 13/04/2019.
//  Copyright © 2019 HvA. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var trailerImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var trailerButton: UIButton!
    @IBOutlet weak var genreLabel: UILabel!
    
    var imageDetail: String?
    var posterDetail: String?
    var titleDetail: String?
    var descriptionDetail: String?
    var urlTrailer: String?
    var genreTrailer: [String] = []
    
    @IBAction func openTrailer(_ sender: Any) {
        
        let player = AVPlayer(url: URL(string: urlTrailer ?? NSLocalizedString("no_url", comment: ""))!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        trailerButton.setTitle(NSLocalizedString("view_trailer", comment: ""), for: .normal)

        trailerImage.kf.setImage(with: URL(string: imageDetail ?? NSLocalizedString("no_image", comment: "")))
        posterImage.kf.setImage(with: URL(string: posterDetail ?? NSLocalizedString("no_image", comment: "")))
        titleLabel.text = titleDetail
        textView.text = descriptionDetail
        genreLabel.text = genreTrailer.joined(separator: ", ")
    }
}
