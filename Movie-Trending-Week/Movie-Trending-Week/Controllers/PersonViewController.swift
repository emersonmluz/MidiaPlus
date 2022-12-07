//
//  PeopleViewController.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 05/12/22.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var failedLabel: UILabel!
    
    var midias = MidiasBrain()
    var person: PersonList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoadingScreen.startLoading(loadingActivity: loadingActivityIndicator, loadingView: loadingView)
        
        midias.personDelegate = self
        midias.apiRequest(midiaType: .person)
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func arrowButton(_ sender: UIButton) {
        startKnowForScreen()
    }
    
    func startKnowForScreen () {
        let knowForViewController = storyboard?.instantiateViewController(withIdentifier: "KnowFor") as! KnowForViewController
        
        //knowForViewController.person = person
        
        self.navigationController?.pushViewController(knowForViewController, animated: true)
    }

}

extension PersonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person?.personList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellSetupPerson
        
        cell.loadCell(midia: person!.personList[indexPath.row])
        
        return cell
    }
}

extension PersonViewController: PersonDelegate {
    func personTransferSuccess(person: PersonList) {
        DispatchQueue.main.async {
            self.person = person
            self.tableView.reloadData()
            LoadingScreen.stopLoading(loadingActivity: self.loadingActivityIndicator, loadingView: self.loadingView)
        }
    }
    
    func personTransferFailed() {
        DispatchQueue.main.async {
            self.failedLabel.isHidden = false
        }
    }
}

extension PersonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard person?.personList[indexPath.row].profilePath != nil else {return}
        
        let knowForViewController = storyboard?.instantiateViewController(withIdentifier: "KnowFor") as! KnowForViewController
        
        knowForViewController.person = person?.personList[indexPath.row]
        
        self.navigationController?.pushViewController(knowForViewController, animated: true)
    }
}
