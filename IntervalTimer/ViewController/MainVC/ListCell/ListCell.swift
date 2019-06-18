//
//  ListCell.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/14/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListCell: UITableViewCell {
  
  // Outlets
  //  @IBOutlet var contenttView: UIView!
  @IBOutlet weak var titleLabel: UILabel! 
  
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var startButton: UIButton!
  
  private var viewModel: AddEditViewModel!
  
  func configure() {
    viewModel.name.asObservable()
      .subscribe(onNext: {
        self.titleLabel.text = $0
      })
    
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    
  }
//  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: .default, reuseIdentifier: reuseIdentifier)
//
//
//  }
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
  
}
