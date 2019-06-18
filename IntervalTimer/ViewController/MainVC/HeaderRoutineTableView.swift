//
//  RoutineTableView.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/14/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit

class HeaderRoutineTableView: UIView {
  
  @IBOutlet var headerView: UIView!
  @IBOutlet weak var routineLabel: UILabel!
  @IBOutlet weak var editButton: UIButton!
  @IBOutlet weak var addButton: UIButton!

  override func draw(_ rect: CGRect) {
        // Drawing code
    }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

}
