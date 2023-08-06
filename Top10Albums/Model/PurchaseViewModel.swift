//
//  PurchaseViewModel.swift
//  Top10Albums
//
//  Created by Jake Gordon on 14/02/2023.
//

import Foundation
import StoreKit

class PurchaseMethods {
    
    let productID = K.productID
    
    func purchasePremium() {
        
        if SKPaymentQueue.canMakePayments() {
            
            let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
        } else {
            
            print("User can't make payments.")
        }
    }
    
    func purchaseStatus() {
        
        UserDefaults.standard.set(true, forKey: productID)
    }
    
    func revealPremium() -> Bool {
        
        let purchaseStatus = UserDefaults.standard.bool(forKey: productID)
        
        return purchaseStatus
        
    }
    
}
