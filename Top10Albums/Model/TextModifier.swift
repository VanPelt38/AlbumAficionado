//
//  TextModifier.swift
//  Top10Albums
//
//  Created by Jake Gordon on 08/05/2023.
//

import Foundation
import UIKit

//Method for converting 'a's in UIText to red without typing effect.

func textModifier(textLabel: String, fontSize: Double) -> [NSMutableAttributedString] {
    
    var stringArray: [NSMutableAttributedString] = []
    let font = UIFont(name: "Gill Sans", size: fontSize)
    
    if let safeFont = font {
        
        let attributes: [NSAttributedString.Key: Any] = [.font: safeFont]
        
        for index in 0..<(textLabel.count) {
            
            let descriptionCharacter = String((textLabel[(textLabel.index((textLabel.startIndex), offsetBy: index))]))
            let descriptionAttributedCharacter = NSMutableAttributedString(string: descriptionCharacter, attributes: attributes)
            
            if descriptionCharacter.lowercased() == "a" {
                
                descriptionAttributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
            } else {
                
                descriptionAttributedCharacter.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: 1))
            }
            
            stringArray.append(descriptionAttributedCharacter)
        }
    }
    
    return stringArray
}
