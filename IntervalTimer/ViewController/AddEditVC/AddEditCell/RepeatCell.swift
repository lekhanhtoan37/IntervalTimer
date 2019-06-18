//
//  RepeatCell.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/17/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

class RepeatCell: BaseTableViewCell {
  
  @IBOutlet weak var repeatLabel: UILabel!
  @IBOutlet weak var repeatSwitch: UISwitch!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
