//
//  WarmUpBaseCell.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/17/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

class WarmUpBaseCell: BaseTableViewCell {
  
  @IBOutlet weak var circleView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var editButton: UIButton!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }


}
