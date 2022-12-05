//
//  TvShowViewController.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 04/12/22.
//

import UIKit

class TvShowViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var midias = MidiasBrain()
    var tvShow: TvShowList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        midias.tvShowDelegate = self
        midias.apiRequest(midiaType: .tv)
        
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

}

extension TvShowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShow?.tvShowList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellSetupTvShow
        
        cell.loadCell(midia: tvShow!.tvShowList[indexPath.row])
        
        return cell
    }
}

extension TvShowViewController: TvShowDelegate {
    func tvShowTransferSuccess(tvShow: TvShowList) {
        DispatchQueue.main.async {
            self.tvShow = tvShow
            self.tableView.reloadData()
        }
    }
    
    func tvShowTransferFailed() {
        print("erro")
    }
    
    
}
