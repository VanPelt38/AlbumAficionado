//
//  Stats.swift
//  Top10Albums
//
//  Created by Jake Gordon on 25/07/2023.
//

import Foundation
import CoreData
import UIKit

class Stats {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func getOverallPercentage() -> String {
        
        var albumsArray: [AlbumItem] = []
        var listenedCount = 0
        let genres = Genres()
        
        let request: NSFetchRequest<AlbumItem> = AlbumItem.fetchRequest()
        
        do {
            albumsArray = try context.fetch(request)
        } catch {
            print("Error loading data from CD: \(error)")
        }
        
        for album in albumsArray {
            
            if album.itemChecked == true {
                
                listenedCount += 1
            }
            
        }
        
        let totalAlbums = (genres.genres.count * 10)
        
        let division = Float(listenedCount) / Float(totalAlbums)
        let perCent = division * 100
        
        let rounded = round(Double(perCent))
        let decimalDropped = Int(rounded)
        let stringPercentage = String(decimalDropped)


        
        return stringPercentage
        
    }
}
