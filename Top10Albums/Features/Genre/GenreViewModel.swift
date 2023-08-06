//
//  GenreViewModel.swift
//  Top10Albums
//
//  Created by Jake Gordon on 08/01/2023.
//

import Foundation

class GenreViewModel {
    
    let genres = Genres()
    let topTens = TopTens()
    let textModifier = TextModifier()
    
    func genreCount() -> Int {
        
        return genres.genres.count
    }
    
    func genreName() -> [String] {
        
        return genres.genres.sorted()
    }
    
    func getTopTenList(genreName: String) -> [[String]] {
        
        var topTenArray: [[String]] = [[]]
        
        switch genreName {
        case K.electroPop:
            topTenArray = topTens.electroPop
        case K.punk:
            topTenArray = topTens.punk
        case K.pop:
            topTenArray = topTens.pop
        case K.tripHop:
            topTenArray = topTens.tripHop
        case K.rock:
            topTenArray = topTens.rock
        case K.soul:
            topTenArray = topTens.soul
        case K.electroHouse:
            topTenArray = topTens.electroHouse
        case K.hipHop:
            topTenArray = topTens.hipHop
        case K.indie:
            topTenArray = topTens.indie
        case K.electronica:
            topTenArray = topTens.electronica
        case K.folkRock:
            topTenArray = topTens.folkRock
        case K.postRock:
            topTenArray = topTens.postRock
        case K.reggaeton:
            topTenArray = topTens.reggaeton
        case K.alternativeRock:
            topTenArray = topTens.alternativeRock
        case K.emo:
            topTenArray = topTens.emo
        case K.grunge:
            topTenArray = topTens.grunge
        default:
            topTenArray = [["func", "didn't", "work"]]
        }
        
        return topTenArray
    }
    
    func modifyText(textLabel: String, fontSize: Double) -> [NSMutableAttributedString] {
        return textModifier.textModifier(textLabel: textLabel, fontSize: fontSize)
    }
    
}
