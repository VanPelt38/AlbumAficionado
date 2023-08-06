//
//  PremiumViewController.swift
//  Top10Albums
//
//  Created by Jake Gordon on 14/02/2023.
//

import UIKit
import StoreKit

class PremiumViewController: UIViewController, SKPaymentTransactionObserver {
    
    
    @IBOutlet weak var restoreButton: UIButton!
    @IBOutlet weak var premiumLabel: UILabel!
    @IBOutlet weak var userStatsLabel: UILabel!
    @IBOutlet weak var listsLabel: UILabel!
    @IBOutlet weak var premiumButton: UIButton!
    
    var UIT = UIText()
    let typingDelay = 0.01
    let loadingView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    
    
   
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            
            let pm = PurchaseMethods()
            
           

            
            
            print("payment queue triggered")
            
            switch transaction.transactionState {
                
            case .restored:
                
                premiumButton.isUserInteractionEnabled = false
                restoreButton.isUserInteractionEnabled = false
                
                loadingView.removeFromSuperview()
               
                pm.purchaseStatus()
                print("Transaction Restored!")
                
                let transRestoredAlert = UIAlertController(title: "Success!", message: "Your purchase has been restored.", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .default)
                transRestoredAlert.addAction(okayAction)
                present(transRestoredAlert, animated: true)
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            case .failed:
                
                loadingView.removeFromSuperview()
          
                
                print("failed triggered")
                premiumButton.isUserInteractionEnabled = true
                restoreButton.isUserInteractionEnabled = true
                var errorDescription = ""
                if let error = transaction.error {
                    
                    errorDescription = error.localizedDescription
                    print("Transaction failed due to error: \(errorDescription)")
                }
                
                let transFailedAlert = UIAlertController(title: "Something went wrong!", message: "Unfortunately your transaction didn't go through (\(errorDescription)). Please try again.", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .default)
                transFailedAlert.addAction(okayAction)
                present(transFailedAlert, animated: true)
           
                
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            case .purchased:
                
                premiumButton.isUserInteractionEnabled = false
                restoreButton.isUserInteractionEnabled = false
                
                loadingView.removeFromSuperview()
                
                print("Transaction successful!")
                
               
                pm.purchaseStatus()

                
                self.dismiss(animated: true, completion: nil)
            
                SKPaymentQueue.default().finishTransaction(transaction)
                
            case .purchasing:
                
                print("purchasing going through")
                
                premiumButton.isUserInteractionEnabled = false
                restoreButton.isUserInteractionEnabled = false
                
                
                view.addSubview(loadingView)
                
            case .deferred:
                
                loadingView.removeFromSuperview()
                
                premiumButton.isUserInteractionEnabled = false
                restoreButton.isUserInteractionEnabled = false
                
                print("deferred triggered")
                let transDeferredAlert = UIAlertController(title: "Transaction Pending!", message: "Please wait while your purchase is resolved.", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .default)
                transDeferredAlert.addAction(okayAction)
                present(transDeferredAlert, animated: true)

            default:
                
                print("default triggered")
                loadingView.removeFromSuperview()
                premiumButton.isUserInteractionEnabled = true
                restoreButton.isUserInteractionEnabled = true
                var errorDescription = ""
                if let error = transaction.error {
                    
                    errorDescription = error.localizedDescription
                    print("Transaction failed due to error: \(errorDescription)")
                }
                
                let transFailedAlert = UIAlertController(title: "Something went wrong!", message: "Unfortunately your transaction didn't go through (\(errorDescription)). Please try again.", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .default)
                transFailedAlert.addAction(okayAction)
                present(transFailedAlert, animated: true)
                loadingView.removeFromSuperview()
                
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            }
           
        }
    }
    

    @IBAction func purchaseButton(_ sender: UIButton) {
        
        let purchaseMethods = PurchaseMethods()
        
        premiumButton.isUserInteractionEnabled = false
        restoreButton.isUserInteractionEnabled = false
        
        purchaseMethods.purchasePremium()
    }
    
    @IBAction func restorePressed(_ sender: UIButton) {
        
        //what if user presses 'restore' when they haven't previously purchased
        
        
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listsLabel.text = ""
        userStatsLabel.text = ""
        premiumLabel.text = ""
        
        
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        loadingView.center = view.center
        loadingView.layer.cornerRadius = 10

        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = CGPoint(x: loadingView.bounds.midX, y: loadingView.bounds.midY)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        
        loadingView.addSubview(activityIndicator)

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
