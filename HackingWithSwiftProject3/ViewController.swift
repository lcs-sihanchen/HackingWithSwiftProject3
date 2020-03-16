//
//  ViewController.swift
//  HackingWithSwiftProject1
//
//  Created by Chen, Sihan on 2020-03-13.
//  Copyright © 2020 Chen, Sihan. All rights reserved.
//



import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // The Return button and the title in view controller (Main Screen)
        title = "Storm Viewer"
        
        // Access to resource path and put all the images into a picture array
        navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items{
            if item.hasPrefix("nssl"){
              
                pictures.append(item)
                
            }
            
        }
        // Sort the array by number
        pictures.sort()
        print(pictures)
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        // This is what's shown in the cell (text)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        
       // Have access to DetailView Controller
        if let vc = storyboard?.instantiateViewController(withIdentifier:"Detail") as? DetailViewController {
            
            // 2: success! Set its selectedImage property + number property and which picture property
            vc.selectedImage = pictures[indexPath.row]
            vc.totalNumber = pictures.count
            vc.ofWhichPicture = String(indexPath.row + 1)
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated:
                true)
        } }
    
}

