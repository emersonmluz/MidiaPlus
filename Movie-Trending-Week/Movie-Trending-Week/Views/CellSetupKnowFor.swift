//
//  CellSetupKnowFor.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 06/12/22.
//

import UIKit

class CellSetupKnowFor: UITableViewCell {
    
    @IBOutlet weak var midiaImageView: UIImageView!
    @IBOutlet weak var nameMidiaLabel: UILabel!
    @IBOutlet weak var calendarLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
   
    let dateFormat = DateFormatter()
    
    func loadCell(midia: Person, index: Int) {
        dateFormat.dateFormat = "dd-MM-yyyy"
        
        midiaImageView.loadFrom(URLAddress: midia.actuations[index].posterPath)
        
        if midia.actuations[index].title != nil {
            nameMidiaLabel.text = midia.actuations[index].title
            calendarLabel.text = dateFormat.string(from: midia.actuations[index].releaseDate!)
        } else {
            nameMidiaLabel.text = midia.actuations[index].name
            calendarLabel.text = dateFormat.string(from: midia.actuations[index].firstAirDate!)
        }
        
        averageLabel.text = String(midia.actuations[index].averageValueVote)
        votesLabel.text = String(midia.actuations[index].voteTotal)
        
        reviewLabel.text = midia.actuations[index].overview
    }
}
