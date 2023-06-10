//
//  TopTenViewModel.swift
//  Top10Albums
//
//  Created by Jake Gordon on 08/01/2023.
//

import Foundation
import WikipediaKit
import UIKit

protocol AlbumManagerDelegate {
    
    func didUpdateAlbumInfo(albumInfo: String, imageURL: UIImage?)
}

struct AlbumManager {
    
    var newResult: String = ""
    
    var delegate: AlbumManagerDelegate?
    
    func getAlbumInfo(albumTitle: String) {
        
        let wikipedia = Wikipedia.shared
        let language = WikipediaLanguage(K.en)
        
        let _ = wikipedia.requestArticle(language: language, title: albumTitle, imageWidth: 5) { result in
            
            switch result {
                
            case .success(let article):
             
                var image: UIImage?
                
                do {
                    if let safeImage = article.imageURL {
                        
                        let data = try Data(contentsOf: safeImage)
                        
                       
                            image = UIImage(data: data)
                        
                       
                    }
                   
                    
                } catch {
                    print("error loading image")
                }
                
                self.delegate?.didUpdateAlbumInfo(albumInfo: article.displayText, imageURL: image)
               
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
}
