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

private let db = Firestore.firestore()

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

func saveToFireStore(percentage: String, uniqueID: String) {

    var docsArray: [QueryDocumentSnapshot] = []
    
    let currentCollection = db.collection(K.percentages)
    
    let query = currentCollection.whereField(K.ID, isEqualTo: uniqueID)
    
    query.getDocuments { querySnapshot, err in
        
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
