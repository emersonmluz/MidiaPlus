//
//  CellSetupPeople.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 05/12/22.
//

import UIKit

class CellSetupPerson: UITableViewCell {
    
    @IBOutlet weak var peopleImageView: UIImageView!
    @IBOutlet weak var peopleNameLabel: UILabel!
    @IBOutlet weak var officeImageView: UIImageView!
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var popularityImageView: UIImageView!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var arrowForKnowFor: UIImageView!
    
    func loadCell (midia: Person) {
        
        if midia.profilePath != nil {
            peopleImageView.loadFrom(URLAddress: midia.profilePath!)
        } else {
            peopleImageView.image = UIImage(systemName: "person")
        }

        peopleNameLabel.text = midia.name
        officeLabel.text = midia.office
        popularityLabel.text = String(midia.popularity)
        
        if midia.actuations.count > 0 {
            arrowForKnowFor.isHidden = false
        } else {
            arrowForKnowFor.isHidden = true
        }
    }
}
