//
//  WelcomeViewModel.swift
//  Top10Albums
//
//  Created by Jake Gordon on 14/02/2023.
//

import Foundation



func IDgenerator() -> String {
    
    let len = 12
    let pswdChars = K.passwordCharacters
    let randomPass = String((0..<len).compactMap{ _ in
        pswdChars.randomElement()
    })
    
    return randomPass
}

func saveID(userID: String) {
    
    if UserDefaults.standard.object(forKey: K.uniqueID) == nil {
        
        UserDefaults.standard.set(userID, forKey: K.uniqueID)
    }
    
}
