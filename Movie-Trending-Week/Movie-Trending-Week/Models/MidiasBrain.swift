//
//  MidiasBrain.swift
//  Movie-Trending-Week
//
//  Created by Émerson M Luz on 02/12/22.
//

import Foundation

protocol MidiaDelegate {
    func midiaTransferSuccess (midia: Midias)
    func midiaTransferFailed ()
}

struct MidiasBrain {
    var delegate: MidiaDelegate?
    
    func apiRequest (midiaType: MidiaType) {
        let url = URL(string: "https://api.themoviedb.org/3/trending/\(midiaType)/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a")
        
        guard url != nil else {return}
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
        
        apiDecoder(request: request)
    }
    
    func apiDecoder(request: URLRequest) {
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard data != nil, error == nil else {return}
            
            do {
                let dateFormat = DateFormatter()
                dateFormat.dateFormat = "yyyy-MM-dd"
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(dateFormat)
                
                let midias = try decoder.decode(Midias.self, from: data!)
                
                delegate?.midiaTransferSuccess(midia: midias)
            
            } catch {
                delegate?.midiaTransferFailed()
                return
            }
        }
        task.resume()
    }

}
