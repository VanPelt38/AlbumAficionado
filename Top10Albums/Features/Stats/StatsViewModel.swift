//
//  StatsViewModel.swift
//  Top10Albums
//
//  Created by Jake Gordon on 06/02/2023.
//

import Foundation
import CoreData
import UIKit
import Firebase
import FirebaseFirestore

class StatsViewModel {
    
    private let db = Firestore.firestore()
    private let stats = Stats()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getPercentage() -> String {
        return stats.getOverallPercentage()
    }
    
    func calcPremiumScore(userPercent: String) async throws -> String {
        
        let doublePercent = Double(userPercent)
        var docsArray: [QueryDocumentSnapshot] = []
        var allPercents: [Double] = []
        var finalPercentile: String = ""
        var result: QuerySnapshot?
        
        
        let currentCollection = db.collection(K.percentages)
        let query = currentCollection.whereField(K.ID, isNotEqualTo: UserDefaults.standard.object(forKey: K.uniqueID) as Any)
        
        
        do {
            result = try await query.getDocuments()
            
        } catch {
            print(error)
        }
        
        if let safeResult = result {
            
            for doc in safeResult.documents {
                docsArray.append(doc)
            }
        }
        
        
        
        for doc in docsArray {
            
            allPercents.append((doc.data()[K.percent] as! NSString).doubleValue)
            
        }
        
        finalPercentile = numberCrunch(scoresArray: allPercents, userPercent: doublePercent ?? 0.0)
        
        return finalPercentile
    }
    
    
    func numberCrunch(scoresArray: [Double], userPercent: Double) -> String {
        
        let sortedScores = scoresArray.sorted()
        var lowerCount = 0
        let totalScores = (sortedScores.count + 1)
        var percentile = 0
        var returnMessage = ""
        
        for number in sortedScores {
            
            if number < userPercent {
                lowerCount += 1
            }
            
        }
        
        if lowerCount == 0 {
            
            percentile = 100
        } else {
            
            let division = Double(lowerCount) / Double(totalScores)
            let multDivision = division * 100
            percentile = 100 - Int(multDivision)
            print(percentile)
        }
        
        
        
        switch percentile {
        case 100:
            returnMessage = "You've listened to fewer albums than any of our users! Time to take your first steps on the road to becoming an Album Aficionado."
        case 76...99:
            returnMessage = "You're in the top \(String(percentile))% of users! Better go out and start spinning some records."
        case 51...75:
            returnMessage = "You're in the top \(String(percentile))% of users! There's a lot of great music you have yet to discover."
        case 26...50:
            returnMessage = "You're in the top \(String(percentile))% of users! You definitely know a thing or two about music."
        case 6...25:
            returnMessage = "You're in the top \(String(percentile))% of users! Congrats - you know more great music than almost anyone."
        case 1...5:
            returnMessage = "You're in the top \(String(percentile))% of users! You, sir, are an Album Aficionado. Pat yourself on the back, Mr Elite!"
        default:
            returnMessage = "Something went wrong here, file an error with developer."
        }
        
        return returnMessage
        
    }
}
