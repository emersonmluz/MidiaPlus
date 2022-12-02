//
//  ViewController.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 02/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var midias = MidiasBrain()
    var movies: Midias?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        midias.delegate = self
        midias.apiRequest(midiaType: .movie)
        
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: MidiaDelegate {
    func midiaTransferSuccess(midia: Midias) {
        DispatchQueue.main.async {
            self.movies = midia
            self.tableView.reloadData()
        }
    }
    
    func midiaTransferFailed() {
        print("Erro")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.moviesList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellSetup
        
        cell.loadCell(midia: movies!.moviesList[indexPath.row])
        
        return cell
    }
}
