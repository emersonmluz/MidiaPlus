//
//  PeopleViewController.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 05/12/22.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var midias = MidiasBrain()
    var person: PersonList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        midias.personDelegate = self
        midias.apiRequest(midiaType: .person)
        
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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
        }
    }
    
    func personTransferFailed() {
        print("erro")
    }
    
    
}
