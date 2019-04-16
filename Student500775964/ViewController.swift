//
//  ViewController.swift
//  Student500775964
//
//  Created by Wouter Kloos on 13/04/2019.
//  Copyright © 2019 HvA. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var trailers: [Trailer]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "TrailerTableViewCell", bundle: nil), forCellReuseIdentifier: "TrailerTableViewCell")
        
        title = NSLocalizedString("title_app", comment: "")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        Alamofire.request("https://appstubs.triple-it.nl/trailers/")
            .responseData(completionHandler: { [weak self] (response) in
                guard let jsonData = response.data else { return }
                
                let decoder = JSONDecoder()
                let testObjectsFromBackend = try? decoder.decode([Trailer].self, from: jsonData)
                
                self?.trailers = testObjectsFromBackend
                self?.tableView.reloadData()
            })
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrailerTableViewCell", for: indexPath) as! TrailerTableViewCell
        
        let urlImage = trailers?[indexPath.row].posterImage ?? NSLocalizedString("no_image", comment: "")
        let url = URL(string: urlImage)
        
        cell.trailerImage.kf.setImage(with: url)
        cell.trailerLabel.text = trailers?[indexPath.row].title
        cell.trailerText.text = trailers?[indexPath.row].description
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.imageDetail = trailers?[indexPath.row].stillImage
        detailVC.posterDetail = trailers?[indexPath.row].posterImage
        detailVC.titleDetail = trailers?[indexPath.row].title
        detailVC.descriptionDetail = trailers?[indexPath.row].description
        detailVC.urlTrailer = trailers?[indexPath.row].url
        detailVC.genreTrailer = trailers?[indexPath.row].genre ?? [NSLocalizedString("no_genre", comment: "")]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

