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
  
  func bindData(_ viewModel: RoutineModel) {
    titleLabel.text = viewModel.title
    timeLabel.text = viewModel.time
  }
  
  static let cellId = "Cell"
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    
  }
}
