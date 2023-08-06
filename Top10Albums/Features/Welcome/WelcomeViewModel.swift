//
//  WelcomeViewModel.swift
//  Top10Albums
//
//  Created by Jake Gordon on 14/02/2023.
//

import Foundation
import Firebase
import FirebaseFirestore


class WelcomeViewModel {
    
    private let db = Firestore.firestore()
    private let stats = Stats()
    private let pm = PurchaseMethods()
    private let textModifier = TextModifier()
    
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
    
    func saveToFireStore(percentage: String, uniqueID: String) {

        var docsArray: [QueryDocumentSnapshot] = []
        
        let currentCollection = db.collection(K.percentages)
        
        let query = currentCollection.whereField(K.ID, isEqualTo: uniqueID)
        
        query.getDocuments { [self] querySnapshot, err in
            
            if let err = err {
                
                print("Error getting docs: \(err)")
            } else {
                
                for doc in querySnapshot!.documents {
                    
                
                    
                    docsArray.append(doc)
                    
                   
                }
                
                
                if docsArray.count == 0 {
                    
                    
                    db.collection(K.percentages).addDocument(data: [
                        K.percent: percentage,
                        K.ID: uniqueID
                    
                    ]) { (error) in
                        
                        if let e = error {
                            
                            print("There was an issue saving data to firestore, \(e)")
                        } else {
                            
                            print("Successfully saved data.")
                        }
                        
                    }
                    
                } else {
                    
                    

                    
                    let docname = docsArray[0].documentID
                    
                    db.collection(K.percentages).document(docname).setData([
                        K.ID: uniqueID,
                        K.percent: percentage
                    ]) { err in
                        
                        if let err = err {
                            print("error writing document: \(err)")
                        } else {
                            print("doc written successfully")
                        }
                    }
                
                }
                
            }
        }
        
       
    }
    
    func getPercentage() -> String {
        return stats.getOverallPercentage()
    }
    
    func getPremium() -> Bool {
        return pm.revealPremium()
    }
    
    func modifyText(textLabel: String, fontSize: Double) -> [NSMutableAttributedString] {
        return textModifier.textModifier(textLabel: textLabel, fontSize: fontSize)
    }
}
