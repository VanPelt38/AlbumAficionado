//
//  AlbumInfoViewModel.swift
//  Top10Albums
//
//  Created by Jake Gordon on 17/01/2023.
//

import Foundation

func parseResponse(rawText: NSAttributedString?) -> [String.SubSequence] {
    
    var result: [String.SubSequence] = []
    
    if let unwrappedText = rawText {
        
        let finalText = unwrappedText.string
        
        let char = Character(K.n)
        result = finalText.split(separator: char, maxSplits: 5)
    }
    
    return result
}


extension String {
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}
