//
//  PremiumViewController.swift
//  Top10Albums
//
//  Created by Jake Gordon on 14/02/2023.
//

import UIKit
import StoreKit

class PremiumViewController: UIViewController, SKPaymentTransactionObserver {
    
    
    @IBOutlet weak var premiumLabel: UILabel!
    @IBOutlet weak var userStatsLabel: UILabel!
    @IBOutlet weak var listsLabel: UILabel!
    @IBOutlet weak var premiumButton: UIButton!
    
    var UIT = UIText()
    let typingDelay = 0.01
   
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            
            let pm = PurchaseMethods()
            
            if transaction.transactionState == .purchased {
                
                print("Transaction successful!")
                
                
                pm.purchaseStatus()
                
                self.dismiss(animated: true, completion: nil)
            
                SKPaymentQueue.default().finishTransaction(transaction)
                
            } else if transaction.transactionState == .failed {
                
                if let error = transaction.error {
                    
                    let errorDescription = error.localizedDescription
                    print("Transaction failed due to error: \(errorDescription)")
                }
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            } else if transaction.transactionState == .restored {
                
                pm.purchaseStatus()
                print("Transaction Restored!")
                
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }
    

    @IBAction func purchaseButton(_ sender: UIButton) {
        
        let purchaseMethods = PurchaseMethods()
        
        purchaseMethods.purchasePremium()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listsLabel.text = ""
        userStatsLabel.text = ""
        premiumLabel.text = ""

        SKPaymentQueue.default().add(self)
        
    
        let unlockPremiumColourChangedString = NSMutableAttributedString(string: "")
        let accessFullColourChangedString = NSMutableAttributedString(string: "")
        let buildOwnColourChangedString = NSMutableAttributedString(string: "")

        DispatchQueue.global(qos: .userInitiated).async { [self] in
            
            for index in 0..<self.UIT.unlockPremium.count {
                
                let character = String(self.UIT.unlockPremium[self.UIT.unlockPremium.index(self.UIT.unlockPremium.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    unlockPremiumColourChangedString.append(attributedCharacter)
                    self.premiumLabel.attributedText = unlockPremiumColourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
            
            for index in 0..<self.UIT.fullUser.count {
                
                let descriptionCharacter = String(self.UIT.fullUser[self.UIT.fullUser.index(self.UIT.fullUser.startIndex, offsetBy: index)])
                let descriptionAttributedCharacter = NSMutableAttributedString(string: descriptionCharacter)
                
                if descriptionCharacter.lowercased() == "a" {
                    
                    descriptionAttributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                DispatchQueue.main.async {
                    accessFullColourChangedString.append(descriptionAttributedCharacter)
                    self.userStatsLabel.attributedText = accessFullColourChangedString
                }
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
            
            for index in 0..<self.UIT.buildOwn.count {
                
                let character = String(self.UIT.buildOwn[self.UIT.buildOwn.index(self.UIT.buildOwn.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    buildOwnColourChangedString.append(attributedCharacter)
                    self.listsLabel.attributedText = buildOwnColourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
        }

    }
    

}
