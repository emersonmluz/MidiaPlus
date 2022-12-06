//
//  KnowForViewController.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 06/12/22.
//

import UIKit

class KnowForViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView.alpha = 0.5
        
        LoadingScreen.startLoading(loadingActivity: loadingActivityIndicator, loadingView: loadingView)
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    

}

extension KnowForViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person?.actuations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellSetupKnowFor
        
        cell.loadCell(midia: person!, index: indexPath.row)
        
        if indexPath.row == person!.actuations.count - 2 {
            LoadingScreen.stopLoading(loadingActivity: self.loadingActivityIndicator, loadingView: self.loadingView)
        }
        
        return cell
    }
}

extension KnowForViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
