//
//  ViewController.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 02/12/22.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    var midias = MidiasBrain()
    var movies: MoviesList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerMidiasCell()
        midias.movieDelegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.selectedImageTintColor = UIColor.systemBlue
        
        LoadingScreen.startLoading(loadingActivity: loadingActivityIndicator, loadingView: loadingView)
        
        midias.apiRequest(midiaType: .movie)
    }
    
    func registerMidiasCell() {
        tableView.register(UINib(nibName: "MidiaTableViewCell", bundle: nil), forCellReuseIdentifier: "midiaCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension MoviesViewController: MoviesDelegate {
    func moviesTransferSuccess(movies: MoviesList) {
        DispatchQueue.main.async {
            self.movies = movies
            self.tableView.reloadData()
           LoadingScreen.stopLoading(loadingActivity: self.loadingActivityIndicator, loadingView: self.loadingView)
        }
    }
    
    func moviesTransferFailed() {
        DispatchQueue.main.async {
            LoadingScreen.stopLoading(loadingActivity: self.loadingActivityIndicator, loadingView: self.loadingView)
            Alert.alertMessage(view: self)
        }
    }
    
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.moviesList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "midiaCell") as! MidiaTableViewCell
        
        cell.loadCell(midia: movies!.moviesList[indexPath.row])
        
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
