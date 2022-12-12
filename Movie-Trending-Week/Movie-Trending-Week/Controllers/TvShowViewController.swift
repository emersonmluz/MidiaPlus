//
//  TvShowViewController.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 04/12/22.
//

import UIKit

class TvShowViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    var midias = MidiasBrain()
    var tvShow: TvShowList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerMidiasCell()
        midias.tvShowDelegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.selectedImageTintColor = UIColor.systemPurple
        
        LoadingScreen.startLoading(loadingActivity: loadingActivityIndicator, loadingView: loadingView)
        
        midias.apiRequest(midiaType: .tv)
    }
    
    func registerMidiasCell() {
        tableView.register(UINib(nibName: "MidiaTableViewCell", bundle: nil), forCellReuseIdentifier: "midiaCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension TvShowViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShow?.tvShowList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "midiaCell") as! MidiaTableViewCell
        
        cell.loadCell(midia: tvShow!.tvShowList[indexPath.row])
        
        return cell
    }
}

extension TvShowViewController: TvShowDelegate {
    func tvShowTransferSuccess(tvShow: TvShowList) {
        DispatchQueue.main.async {
            self.tvShow = tvShow
            self.tableView.reloadData()
            LoadingScreen.stopLoading(loadingActivity: self.loadingActivityIndicator, loadingView: self.loadingView)
        }
    }
    
    func tvShowTransferFailed() {
        DispatchQueue.main.async {
            LoadingScreen.stopLoading(loadingActivity: self.loadingActivityIndicator, loadingView: self.loadingView)
            Alert.alertMessage(view: self)
        }
    }
    
    
}

extension TvShowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
