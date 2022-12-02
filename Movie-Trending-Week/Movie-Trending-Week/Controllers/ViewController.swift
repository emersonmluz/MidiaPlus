//
//  ViewController.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 02/12/22.
//

import UIKit

class ViewController: UIViewController {

    var midias = MidiasBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        midias.delegate = self
      
        // Do any additional setup after loading the view.
    }


}

extension ViewController: MidiaDelegate {
    func midiaTransferSuccess(midia: Midias) {
        DispatchQueue.main.async {
          
        }
    }
    
    func midiaTransferFailed() {
        print("Erro")
    }
    
}

