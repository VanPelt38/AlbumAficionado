//
//  TopTenViewModel.swift
//  Top10Albums
//
//  Created by Jake Gordon on 08/01/2023.
//

import Foundation
import UIKit
import SwiftSoup

protocol AlbumManagerDelegate {
    
    func didUpdateAlbumInfo(albumInfo: String, imageURL: UIImage?)
}

struct AlbumManager {
    
    var delegate: AlbumManagerDelegate?
    var textModifier = TextModifier()
    
    func getAlbumInfo(albumTitle: String, urlTitle: String) async {
        print("get album info was called")
        print(albumTitle)
        var description = ""
        do {
            let wikiURL = URL(string: "https://en.wikipedia.org/wiki/\(albumTitle)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
            let html = try String(contentsOf: wikiURL)
            let document = try SwiftSoup.parse(html)
            print(try document.title())
            description = try document.select("p:contains(\(urlTitle)").first()!.text()
            
            print(description)
        } catch {
            print(error)
        }
 
        
        var urlComponents = URLComponents(string: "https://en.wikipedia.org/w/api.php?")!
        urlComponents.queryItems = [
            "action" : "parse",
            "page" : albumTitle,
            "format" : "json"
        ].map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            if let safeData = data {
               
                do {
            
                // Convert Data to JSON
                if let jsonObject = try JSONSerialization.jsonObject(with: safeData, options: []) as? [String: Any], let parseData = jsonObject["parse"] as? [String: Any],
                   let textData = parseData["text"] as? [String: Any],
                   let html = textData["*"] as? String {
                    
                    if let localFileURL = extractImageURL(from: html) {
                        
                        if let imageURL = convertToLocalImageURL(localFileURL) {
                            
                            
                            var image: UIImage?
                            
                            do {
                                if let newImageURL = URL(string: imageURL) {
                                    let data = try Data(contentsOf: newImageURL)
                                    
                                    
                                    image = UIImage(data: data)
                                    
                                }
                                
                                
                                
                            } catch {
                                print("error loading image")
                            }
                            
                            self.delegate?.didUpdateAlbumInfo(albumInfo: description, imageURL: image)
                        }
                        
                        
                    }
                    
                }
            } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            
        }
        task.resume()
    }
    
    
    func extractImageURL(from html: String) -> String? {
        // You'll need to parse the HTML to find the image URL using regular expressions or an HTML parser library.
        // Due to the complexity of parsing HTML, it's recommended to use an HTML parser like SwiftSoup or use a regular expression library to extract the image URL.
        // Here's a simple example using regular expressions to find the first image URL in the HTML:
        
        let pattern = "<img.*?src=\"(.*?)\".*?>"
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: html.utf16.count)
        
        if let match = regex.firstMatch(in: html, options: [], range: range) {
            if let imageURLRange = Range(match.range(at: 1), in: html) {
                let imageURL = String(html[imageURLRange])
                return imageURL
            }
        }
        
        return nil
    }
    
    func convertToLocalImageURL(_ localURL: String) -> String? {
        // Replace "file://" with "https://"
        var webURL = "https:" + localURL
        
        return webURL
    }

   
    func modifyText(textLabel: String, fontSize: Double) -> [NSMutableAttributedString] {
        return textModifier.textModifier(textLabel: textLabel, fontSize: fontSize)
    }
}

