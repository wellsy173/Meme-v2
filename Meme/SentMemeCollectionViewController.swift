//
//  SentMemeCollectionViewController.swift
//  Meme
//
//  Created by Simon Wells on 2020/6/1.
//  Copyright © 2020 Simon Wells. All rights reserved.
//

import Foundation
import UIKit

class SentMemeCollectionViewController: UICollectionViewController {
    
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        Meme = appDelegate.memes
        toggleNavAndTabBars(on: false)
        self.collectionView?.reloadData()
    }
    
        func toggleNavAndTabBars(on: Bool) {
            self.tabBarController?.tabBar.isHidden = on
            self.navigationController?.navigationBar.isHidden = on
        }
        
        // MARK: UICollectionView
        
    func collectionView(_collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.memes.count
        }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexpath: IndexPath) ->UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemeCollectionViewCell", for: indexpath) as! SentMemeCollectionViewCell
        cell.imageView?.image = UIImage ///finish///
        
        return cell
    }
        
    
        //Mark: UICollecionViewDelegate
        
func tableView(_tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
    detailController.memes = self.meme[(indexPath as NSIndexPath).row]
    self.navigationController!.pushViewController(detailController, animated: true)
 
    
    //MARK Add to the meme array on the Application Delegate
    
    let object = UIApplication.shared.delegate
    let appDelegate = object as! AppDelegate
    return AppDelegate.memes
}
}
