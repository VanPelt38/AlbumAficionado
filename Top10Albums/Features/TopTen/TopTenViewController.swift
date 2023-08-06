//
//  TopTenViewController.swift
//  Top10Albums
//
//  Created by Jake Gordon on 08/01/2023.
//

import UIKit
import CoreData

class TopTenViewController: UIViewController {

    @IBOutlet weak var topTenTable: UITableView!
    
    @IBOutlet weak var addAlbumButton: UIBarButtonItem!
    
    var topTenList: [[String]] = [[]]
    var genre: String = ""
    var albumInfo: String = ""
    var albumManager = AlbumManager()
    var albumTitleToSearch: String = ""
    var albumTitleToSearch2: String = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var coreDataArray = [AlbumItem]()
    var longPressGesture: UILongPressGestureRecognizer!
    var userAlbums = [UserAlbum]()
    var userAlbumChosen = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userAlbumChosen == false {
            
            addAlbumButton.isHidden = true
        }
        
        topTenTable.delegate = self
        topTenTable.dataSource = self
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        topTenTable.register(UINib(nibName: K.topTenTableViewCell, bundle: nil), forCellReuseIdentifier: K.newTopTenCell)
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressGestureRecognized(_:)))
        self.topTenTable.addGestureRecognizer(longPressGesture)
        
       
        
        loadData(with: genre)

        loadUserAlbums(with: genre)
        coreDataArray = []
        if coreDataArray == [] && userAlbumChosen == false {
            
  
            
            for album in topTenList {
                
                let newAlbum = AlbumItem(context: self.context)
                
                newAlbum.itemChecked = false
                newAlbum.tableName = album[0]
                newAlbum.wikiName = album[1]
                newAlbum.urlName = album[2]
                newAlbum.genre = genre
                
                coreDataArray.append(newAlbum)

                
            }
            
        }
        
        topTenTable.reloadData()
  
    }
    
    
    @IBAction func addAlbumPressed(_ sender: UIBarButtonItem) {
        
        let createAlbumAlert = UIAlertController(title: K.whatsYourAlbumCalled, message: "", preferredStyle: .alert)
        createAlbumAlert.addTextField { (textField) in
            textField.placeholder = K.albumNameHere
            
        }
        let createAction = UIAlertAction(title: K.createMyAlbum, style: .default) { alertAction in
            
            
            if let textFields = createAlbumAlert.textFields {
                
                if let text = textFields[0].text {
                    
                    if text != "" {
                        
                        let userAlbum = UserAlbum(context: self.context)
                        userAlbum.name = text
                        userAlbum.listName = self.genre
                        self.userAlbums.append(userAlbum)
                    }
                    
                }
                
                
            }

            
            
            
            DispatchQueue.main.async {
                self.saveData()
                self.topTenTable.reloadData()
            }
        }
        
        
        let cancelAction = UIAlertAction(title: K.actuallyNo, style: .default)
        createAlbumAlert.addAction(createAction)
        createAlbumAlert.addAction(cancelAction)
        present(createAlbumAlert, animated: true)
    }
    
    
    @objc func longPressGestureRecognized(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            
            if let section = self.topTenTable.indexPathForRow(at: sender.location(in: self.topTenTable))?.row {
                
                print("crash point 1")
                
                let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
                feedbackGenerator.prepare()
                feedbackGenerator.impactOccurred()

                
                if userAlbumChosen && userAlbums != [] {
                    
                    print("crash point 2")
                    
                    userAlbums[section].done = !userAlbums[section].done
                } else if coreDataArray != [] {
                    
                    print("crash point 3")
                    coreDataArray[section].itemChecked = !coreDataArray[section].itemChecked
                }
                
                print("crash point 4")
                
                saveData()
            }
            
        }
    }
    
    func saveData() {
        
        do {
            try context.save()
        } catch {
            print("Error saving data.")
        }
        
        self.topTenTable.reloadData()
        
    }
    
    func loadData(with genreName: String) {
        
        let request: NSFetchRequest<AlbumItem> = AlbumItem.fetchRequest()
        
        request.predicate = NSPredicate(format: K.genreLike, genreName)
        let sortDescriptor = NSSortDescriptor(key: K.tableName, ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
        request.sortDescriptors = [sortDescriptor]
        
        do {
            coreDataArray = try context.fetch(request)
        } catch {
            print("Error loading data from CD: \(error)")
        }
        print("load method has worked successfully")
    }
    
    func loadUserAlbums(with listName: String) {
        
        let request: NSFetchRequest<UserAlbum> = UserAlbum.fetchRequest()
        request.predicate = NSPredicate(format: K.listNameLike, listName)
        
        do {
            userAlbums = try context.fetch(request)
        } catch {
            print("Error loading user albums from CD: \(error)")
        }
        print("loading user albums has happened successfully")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == K.topTenAlbumInfoSeg {
            
            let destinationVC = segue.destination as! AlbumInfoViewController
            destinationVC.albumTitleForSearching = albumTitleToSearch
            destinationVC.albumTitleForSearching2 = albumTitleToSearch2
           
        }

    }

}

extension TopTenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if userAlbumChosen && userAlbums == [] {
            
            return 1
        } else if userAlbumChosen {
            
            return userAlbums.count
        } else {
            
            return coreDataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = topTenTable.dequeueReusableCell(withIdentifier: K.newTopTenCell, for: indexPath) as! TopTenTableViewCell
        cell.contentView.layer.cornerRadius = 12
        cell.contentView.clipsToBounds = true
        cell.recordImage.isHidden = true
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        let margins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        cell.frame = cell.frame.inset(by: margins)
        
        
        if userAlbumChosen && userAlbums == [] {
            
            
            let genreText = albumManager.modifyText(textLabel: K.noAlbumsYet, fontSize: 20.0)
            let genreColourString = NSMutableAttributedString(string: "")

                    for character in genreText {
                      
                        genreColourString.append(character)
                    }
            
                    cell.nameLabel?.attributedText = genreColourString
            cell.isUserInteractionEnabled = false
      
            return cell
            
        } else if userAlbumChosen {
            
            let genreText = albumManager.modifyText(textLabel: userAlbums[indexPath.row].name ?? "error", fontSize: 20.0)
            let genreColourString = NSMutableAttributedString(string: "")

                    for character in genreText {
                      
                        genreColourString.append(character)
                    }
            
                    cell.nameLabel?.attributedText = genreColourString
            
            cell.recordImage.isHidden = userAlbums[indexPath.row].done ? false : true
            
            return cell
            
        } else {
            
            let genreText = albumManager.modifyText(textLabel: coreDataArray[indexPath.row].tableName ?? "error", fontSize: 20.0)
            let genreColourString = NSMutableAttributedString(string: "")

                    for character in genreText {
                      
                        genreColourString.append(character)
                    }
            
                    cell.nameLabel?.attributedText = genreColourString
            
            cell.recordImage.isHidden = coreDataArray[indexPath.row].itemChecked ? false : true
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete && userAlbumChosen == true && userAlbums.count > 1 {
            
            
            context.delete(userAlbums[indexPath.row])
            userAlbums.remove(at: indexPath.row)
            topTenTable.deleteRows(at: [indexPath], with: .fade)
            saveData()

        } else if editingStyle == .delete && userAlbumChosen == true && userAlbums.count == 1 {

            
            if let cell = topTenTable.cellForRow(at: indexPath) {
                
            
                context.delete(userAlbums[indexPath.row])
            
                userAlbums.remove(at: indexPath.row)

                cell.accessoryType = .none
              
                saveData()
            }
            
        }
    }
    
}

extension TopTenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if userAlbumChosen == false {
            
            albumTitleToSearch = coreDataArray[indexPath.row].wikiName ?? "error"
            albumTitleToSearch2 = coreDataArray[indexPath.row].urlName ?? "error"

            
            topTenTable.deselectRow(at: indexPath, animated: true)
            
            performSegue(withIdentifier: K.topTenAlbumInfoSeg, sender: self)
        }
    }
    
}
