//
//  GenreViewController.swift
//  Top10Albums
//
//  Created by Jake Gordon on 06/01/2023.
//

import UIKit
import CoreData

class GenreViewController: UIViewController {

    @IBOutlet weak var genreTable: UITableView!
    @IBOutlet weak var addListButton: UIBarButtonItem!
    
    var viewModel = GenreViewModel()
    var topTenList: [[String]] = [[]]
    var genreMoniker: String = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var userAlbumsList = [NewList]()
    var longPressGesture: UILongPressGestureRecognizer!
    var wasUserAlbumChosen = false
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        wasUserAlbumChosen = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addListButton.isHidden = true
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        let pm = PurchaseMethods()
        
        if pm.revealPremium() {
            
            addListButton.isHidden = false
        }
        
        loadData()

        genreTable.delegate = self
        genreTable.dataSource = self
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureRecognized(_:)))
        genreTable.addGestureRecognizer(longPressGesture)
       
        genreTable.reloadData()
    }

    
    @objc func longPressGestureRecognized(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            
            if let theTable = self.genreTable.indexPathForRow(at: sender.location(in: self.genreTable)) {
               
                let theRow = theTable.row
                
                if theRow >= viewModel.genreCount() {
                    
                    context.delete(userAlbumsList[theRow - viewModel.genreCount()])
                    userAlbumsList.remove(at: theRow - viewModel.genreCount())
                    saveData()
                }

            }
         
        }
    }
    
    func loadData() {
        
        let request: NSFetchRequest<NewList> = NewList.fetchRequest()
        
        do {
            userAlbumsList = try context.fetch(request)
        } catch {
            print("Error loading data from CD: \(error)")
        }
        print("load method has worked successfully")
    }
    
    func saveData() {
        
        do {
            try context.save()
        } catch {
            print("Error saving data.")
        }
        
        self.genreTable.reloadData()
        
    }


 
    @IBAction func createListButton(_ sender: UIBarButtonItem) {
        
        let createListAlert = UIAlertController(title: K.whatsYourListCalled, message: "", preferredStyle: .alert)
        createListAlert.addTextField { (textField) in
            textField.placeholder = K.listNameHere
            
        }
        let createAction = UIAlertAction(title: K.createMyList, style: .default) { alertAction in
            
            
            
            if let textFields = createListAlert.textFields {
                
                if let text = textFields[0].text {
                    
                    if text != "" {
                        
                        let newList = NewList(context: self.context)
                        
                        newList.tableName = text
                        self.userAlbumsList.append(newList)
                    }
                    
                }
                
                
            }
            
            
            DispatchQueue.main.async {
                self.saveData()
                self.genreTable.reloadData()
            }
        }
        
        
        let cancelAction = UIAlertAction(title: K.actuallyNo, style: .default)
        createListAlert.addAction(createAction)
        createListAlert.addAction(cancelAction)
        present(createListAlert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == K.genreTopTenSeg {
            
            let destinationVC = segue.destination as! TopTenViewController
            destinationVC.topTenList = topTenList
            destinationVC.genre = genreMoniker
            destinationVC.userAlbumChosen = wasUserAlbumChosen

        }
    }
 
}

extension GenreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      
            
        return viewModel.genreCount() + userAlbumsList.count
       
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = genreTable.dequeueReusableCell(withIdentifier: K.genreCell, for: indexPath)
        cell.textLabel?.textAlignment = .center
        cell.contentView.layer.cornerRadius = 12
        cell.contentView.clipsToBounds = true
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        let margins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        cell.frame = cell.frame.inset(by: margins)
        
        if indexPath.row < viewModel.genreCount() {
            
            
            let genreText = viewModel.modifyText(textLabel: (viewModel.genreName()[indexPath.row]), fontSize: 20.0)
            let genreColourString = NSMutableAttributedString(string: "")

                    for character in genreText {
                      
                        genreColourString.append(character)
                    }
            
                    cell.textLabel?.attributedText = genreColourString
            
        } else {
            
            if let safeName = userAlbumsList[indexPath.row - viewModel.genreCount()].tableName {
                
                let genreText = viewModel.modifyText(textLabel: (safeName), fontSize: 20.0)
                let genreColourString = NSMutableAttributedString(string: "")
                
               

                        for character in genreText {
                          
                            genreColourString.append(character)
                        }
                
                        cell.textLabel?.attributedText = genreColourString
            }
            
           
           
            
        }
        
        
        return cell
    }
    
    
    
    
}

extension GenreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row < viewModel.genreCount() {
            
            topTenList = viewModel.getTopTenList(genreName: viewModel.genreName()[indexPath.row])
            print("this is top10list: \(topTenList)")
            genreMoniker = viewModel.genreName()[indexPath.row]
            
        } else {
            
            genreMoniker = userAlbumsList[indexPath.row - viewModel.genreCount()].tableName ?? "error"
            wasUserAlbumChosen = true
            
        }
        
        genreTable.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: K.genreTopTenSeg, sender: self)

    }
    
}
