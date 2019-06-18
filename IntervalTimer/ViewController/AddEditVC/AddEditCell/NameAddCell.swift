//
//  AddEditCell.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/17/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NameAddCell: BaseTableViewCell {
  
  let bag = DisposeBag()
  
  let routineViewModel = RoutineViewModel()
  
  var viewModel: AddEditViewModel! {
    didSet{
      bindingData()
    }
  }
  
  @IBOutlet weak var nameTextField: UITextField! {
    didSet {

    }
  }
  
//  func configure() {
//    nameTextField.text = viewModel.
//  }
  func bindingData() {
    nameTextField.rx
      .controlEvent(.editingChanged)
      .withLatestFrom(nameTextField.rx.text.orEmpty)
      .subscribe(onNext: { [weak self] text in
        print(text)
        self?.viewModel.name.accept(text)
      })
      .disposed(by: bag)
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
