//
//  MidiasBrain.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 02/12/22.
//

import Foundation

protocol MoviesDelegate {
    func moviesTransferSuccess (movies: MoviesList)
    func moviesTransferFailed ()
}

protocol TvShowDelegate {
    func tvShowTransferSuccess (tvShow: TvShowList)
    func tvShowTransferFailed ()
}

struct MidiasBrain {
    var movieDelegate: MoviesDelegate?
    var tvShowDelegate: TvShowDelegate?
    
    func apiRequest (midiaType: MidiaType) {
        let url = URL(string: "https://api.themoviedb.org/3/trending/\(midiaType)/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a")
        
        guard url != nil else {return}
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard data != nil, error == nil else {return}
            
            if midiaType == .movie {
                apiDecoderMovie(data: data!)
            } else {
                apiDecoderTvShow(data: data!)
            }
            
        }
        task.resume()
    }
    
    func apiDecoderMovie(data: Data) {
        do {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormat)
            
            let midias = try decoder.decode(MoviesList.self, from: data)
            
            movieDelegate?.moviesTransferSuccess(movies: midias)
        
        } catch {
            movieDelegate?.moviesTransferFailed()
            return
        }
    }
    
    func apiDecoderTvShow (data: Data) {
        do {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormat)
            
            let midias = try decoder.decode(TvShowList.self, from: data)
            
            tvShowDelegate?.tvShowTransferSuccess(tvShow: midias)
        
        } catch {
            tvShowDelegate?.tvShowTransferFailed()
            return
        }
    }

}
