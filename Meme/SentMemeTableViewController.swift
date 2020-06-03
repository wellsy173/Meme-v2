//
//  sentMemeTableViewController.swift
//  Meme
//
//  Created by Simon Wells on 2020/6/2.
//  Copyright © 2020 Simon Wells. All rights reserved.
//

import Foundation
import UIKit

//Mark: - ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    

    // MARK: Properties - finish later - 2/6/20
 var memes: [Meme]!

    //MARK: Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count //check memes//
}

    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        cell.imageView?.image = UIImage

        return cell
}

    func tableView(_ tableview: UITableView, didSelectRowAt indexpath: IndexPath) {
        
        let detailController = self.storyboard?.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
            detailController.meme = self.meme[(IndexPath as NSIndexPath).row]
            
        self.navigationController!.pushViewController(detailController, animated: true)
        
        //MARK Add to the meme array on the Application Delegate
        
    var memes: [AppDelegate.Meme]!
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes 
}
}
