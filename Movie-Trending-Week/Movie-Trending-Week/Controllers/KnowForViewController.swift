//
//  KnowForViewController.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 06/12/22.
//

import UIKit

class KnowForViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return cell
    }
}

extension KnowForViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
