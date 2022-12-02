//
//  CellSetup.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 02/12/22.
//

import UIKit

class CellSetup: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var calendarImageView: UIImageView!
    @IBOutlet weak var averageOfVotesLabel: UILabel!
    @IBOutlet weak var averageOfotesImageView: UIImageView!
    @IBOutlet weak var numberOfVotesLabel: UILabel!
    @IBOutlet weak var numberOfVotesImageView: UIImageView!
    
    let dateFormat = DateFormatter()
    
    func loadCell (midia: Movie) {
        dateFormat.dateFormat = "dd-MM-yyyy"
        
        posterImageView.loadFrom(URLAddress: midia.posterPath)
        movieNameLabel.text = midia.title
        
        releaseDateLabel.text = dateFormat.string(from: midia.releaseDate)
        calendarImageView.image = UIImage(systemName: "calendar.circle")
        calendarImageView.tintColor = UIColor.red
        
        averageOfVotesLabel.text = String(midia.averageValueVote)
        averageOfotesImageView.image = UIImage(systemName: "star.circle")
        averageOfotesImageView.tintColor = UIColor.orange
        
        numberOfVotesLabel.text = String(midia.voteTotal)
        numberOfVotesImageView.image = UIImage(systemName: "person.circle")
        numberOfVotesImageView.tintColor = UIColor.purple
    }
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + URLAddress) else {
            return
        }
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: url)
            
            DispatchQueue.main.async { [weak self] in
                if let imageData = imageData {
                    if let loadedImage = UIImage(data: imageData) {
                            self?.image = loadedImage
                    }
                }
            }
        }

    }
}
