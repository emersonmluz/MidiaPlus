//
//  Alert.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 07/12/22.
//

import UIKit

class Alert {
    static func alertMessage (view: UIViewController) {
        let alert = UIAlertController(title: nil, message: "Falha ao carregar arquivos!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        view.present(alert, animated: true)
    }
}
