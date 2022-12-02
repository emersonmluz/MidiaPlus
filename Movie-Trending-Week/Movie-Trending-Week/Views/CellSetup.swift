//
//  CellSetup.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 02/12/22.
//

import UIKit

class CellSetup: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var calendarImageView: UIImageView!
    
    let dateFormat = DateFormatter()
    
    func loadCell (midia: Movie) {
        dateFormat.dateFormat = "dd-MM-yyyy"
        
        posterImageView.loadFrom(URLAddress: midia.posterPath)
        movieName.text = midia.title
        
        calendarImageView.image = UIImage(systemName: "calendar")
        calendarImageView.tintColor = UIColor.red
        releaseDate.text = dateFormat.string(from: midia.releaseDate)
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
