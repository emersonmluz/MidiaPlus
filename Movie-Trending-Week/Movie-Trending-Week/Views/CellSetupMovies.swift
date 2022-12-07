//
//  CellSetup.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 02/12/22.
//

import UIKit

class CellSetupMovies: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var calendarImageView: UIImageView!
    @IBOutlet weak var averageOfVotesLabel: UILabel!
    @IBOutlet weak var averageOfVotesImageView: UIImageView!
    @IBOutlet weak var numberOfVotesLabel: UILabel!
    @IBOutlet weak var numberOfVotesImageView: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    let dateFormat = DateFormatter()
    
    func loadCell (midia: Movie) {
        dateFormat.dateFormat = "dd-MM-yyyy"
        
        posterImageView.loadFrom(URLAddress: midia.posterPath)
        movieNameLabel.text = midia.title
        
        releaseDateLabel.text = dateFormat.string(from: midia.releaseDate)
        calendarImageView.image = UIImage(systemName: "calendar.circle")
        calendarImageView.tintColor = UIColor.red
        
        averageOfVotesLabel.text = String(midia.averageValueVote)
        averageOfVotesImageView.image = UIImage(systemName: "star.circle")
        averageOfVotesImageView.tintColor = UIColor.orange
        
        numberOfVotesLabel.text = String(midia.voteTotal)
        numberOfVotesImageView.image = UIImage(systemName: "person.circle")
        numberOfVotesImageView.tintColor = UIColor.purple
        
        reviewLabel.text = midia.overview
        
    }
    
}


