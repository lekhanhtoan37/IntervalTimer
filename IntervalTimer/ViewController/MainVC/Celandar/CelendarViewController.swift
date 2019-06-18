//
//  CelendarViewController.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/14/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CelendarViewController: UICollectionViewController {
  
  var dayViewHeight: CGFloat = 10
  var dayViewWidth: CGFloat = 10
  
  lazy var dayView : UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: dayViewWidth, height: dayViewHeight))
    view.makeCircular()
    view.backgroundColor = .red
    return view
  }()
  let weekdays = 7
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.collectionView!.register(CelendarCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = #colorLiteral(red: 0.07492122799, green: 0.03107580356, blue: 0.152825743, alpha: 1)
    
    
  }
  
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return weekdays
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
    // Configure the cell
    
    return cell
  }
  
  // MARK: UICollectionViewDelegate
  
  /*
   // Uncomment this method to specify if the specified item should be highlighted during tracking
   override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
   return true
   }
   */
  
  /*
   // Uncomment this method to specify if the specified item should be selected
   override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
   return true
   }
   */
  
  /*
   // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
   override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
   return false
   }
   
   override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
   return false
   }
   
   override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
   
   }
   */
  
}
