//
//  AlbumInfoViewController.swift
//  Top10Albums
//
//  Created by Jake Gordon on 08/01/2023.
//

import UIKit
import WebKit

class AlbumInfoViewController: UIViewController, AlbumManagerDelegate {
    
    @IBOutlet weak var myWebView: WKWebView!
    
    @IBOutlet weak var albumInfoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    var albumManager = AlbumManager()
    var albumTitleForSearching: String = ""
    var albumTitleForSearching2: String = ""
    
    let typingDelay = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colourChangedString = NSMutableAttributedString(string: "")

        DispatchQueue.global(qos: .userInitiated).async { [self] in
            
            for index in 0..<self.albumTitleForSearching2.count {
                
                let character = String(self.albumTitleForSearching2[self.albumTitleForSearching2.index(self.albumTitleForSearching2.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    colourChangedString.append(attributedCharacter)
                    self.titleLabel.attributedText = colourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
            
                    }
        
        albumManager.delegate = self
        
        Task.init {
            try await albumManager.getAlbumInfo(albumTitle: albumTitleForSearching, urlTitle: albumTitleForSearching2)
        }
        
        

    }
    
    func didUpdateAlbumInfo(albumInfo: String, imageURL: UIImage?) {
        DispatchQueue.main.async {
           
            print("album info is being updated")
            let parsedResponse = parseResponse(rawText: albumInfo.html2Attributed ?? nil)
            let newString = String(parsedResponse[0])
            
            let albumColourChangedString = NSMutableAttributedString(string: "")

            DispatchQueue.global(qos: .userInitiated).async { [self] in
                
                for index in 0..<newString.count {
                    
                    let character = String(newString[newString.index(newString.startIndex, offsetBy: index)])
                    let attributedCharacter = NSMutableAttributedString(string: character)
                    
                    if character.lowercased() == "a" {
                        
                        attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                    }
                    
                    
                    DispatchQueue.main.async {
                        
                        albumColourChangedString.append(attributedCharacter)
                        self.albumInfoLabel.attributedText = albumColourChangedString
                        
                    }
                    
                    Thread.sleep(forTimeInterval: self.typingDelay)
                }
                
                        }
    print("image about to be done")
            self.albumImage.image = imageURL
            if let safeImage = imageURL {
                print("safeimage is got")
                self.albumImage.image = safeImage
            }

            

        }
    }

}

