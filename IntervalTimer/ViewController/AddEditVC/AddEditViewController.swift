  //
  //  AddEditViewController.swift
  //  IntervalTimer
  //
  //  Created by Lê Toàn on 6/15/19.
  //  Copyright © 2019 Lê Toàn. All rights reserved.
  //
  
  import UIKit
  import RxSwift
  import RxCocoa
  import RxDataSources
  
  
  class AddEditViewController: UITableViewController {
    
    let nameRoutine = BehaviorRelay<String>(value: "")
    let timeRoutine = BehaviorRelay<String>(value: "10:10")
    
    lazy var saveButton : UIButton = {
      let view = UIButton(type: .custom)
      view.setTitle("Save", for: .normal)
      view.setTitleColor(#colorLiteral(red: 0.01194981113, green: 0.4769998789, blue: 0.9994105697, alpha: 1), for: .normal)
      return view
    }()
    
    lazy var backButton : UIButton = {
      let view = UIButton(type: .custom)
      view.setTitle("Back", for: .normal)
      view.setTitleColor(#colorLiteral(red: 0.01194981113, green: 0.4769998789, blue: 0.9994105697, alpha: 1), for: .normal)
      return view
    }()
    
    let bag = DisposeBag()
    var viewModel: AddEditViewModel!
    init() {
      
      super.init(nibName: "AddEditViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      self.viewModel = AddEditViewModel(navigator: self.navigationController!)
      
      setUpTableView()
      setUpNavigation()
//      actionSave()
      bindData()
      
    }
    
    func setupDataSource() {
      let dataSource = RxTableViewSectionedReloadDataSource<AddEditSectionModel> ( configureCell: { (datasource, tableView, indexPath, _) in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "1", for: indexPath) as? NameAddCell else { return UITableViewCell() }
        return cell
      })
      
    }
    
    func setUpNavigation() {
      navigationController?.navigationBar.isHidden = false
      navigationController?.navigationBar.tintColor = .white
      navigationController?.navigationBar.tintColor = .black
      navigationItem.title = "Add Routine"
      navigationItem.rightBarButtonItem = UIBarButtonItem(customView: saveButton)
      navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
      
//      _ = backButton.rx.tap.asDriver().throttle(.milliseconds(500))
//        .drive(onNext: { [weak self] _ in
//          self?.dismiss(animated: true, completion: nil)
//        }).disposed(by: bag)
//      
    }
    
    func bindData() {
      let input = AddEditViewModel.Input(cancelTrigger: backButton.rx.tap.asDriver(), saveTrigger: saveButton.rx.tap.asDriver(), title: nameRoutine.asDriver(), time: timeRoutine.asDriver())
      let output = viewModel.transform(input: input)
      
      output.enableSave.drive().disposed(by: bag)
      
      output.dismiss.drive().disposed(by: bag)
    }
    
    
//    func actionSave() {
//      _ = saveButton.rx.tap.asDriver().throttle(.milliseconds(500))
//        .drive(onNext: { [weak self] _ in
//          //TODO: Save
//          guard let `self` = self else {return}
//
//
//          self.dismiss(animated: true, completion: nil)
//        }).disposed(by: bag)
//    }
    
    func setUpTableView() {
      tableView.delegate = nil
      tableView.rx.setDelegate(self).disposed(by: bag)
      tableView.estimatedRowHeight = tableView.rowHeight
      tableView.rowHeight = UITableView.automaticDimension
      tableView.backgroundColor = #colorLiteral(red: 0.9333106875, green: 0.9372582436, blue: 0.9567168355, alpha: 1)
      tableView.register(UINib(nibName: "NameAddCell", bundle: nil), forCellReuseIdentifier: "1")
      tableView.register(UINib(nibName: "TypeAddCell", bundle: nil), forCellReuseIdentifier: "2")
      tableView.register(UINib(nibName: "WarmUpBaseCell", bundle: nil), forCellReuseIdentifier: "3")
      tableView.register(UINib(nibName: "IntervalCycleCell", bundle: nil), forCellReuseIdentifier: "4")
      tableView.register(UINib(nibName: "LowHighCell", bundle: nil), forCellReuseIdentifier: "5")
      tableView.register(UINib(nibName: "RepeatCell", bundle: nil), forCellReuseIdentifier: "6")
      
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
      case 0:
        return 2
      case 1:
        return 1
      case 2:
        return 2
      case 3:
        return 1
      case 4:
        return 1
      default:
        return 0
      }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "1", for: indexPath) as! NameAddCell
      
      switch indexPath.section {
      case 0:
        if indexPath.row == 0 {
          let cell = tableView.dequeueReusableCell(withIdentifier: "1", for: indexPath) as! NameAddCell
          cell.nameTextField.placeholder = "Name"
          cell.nameTextField.rx.text
            .subscribe(onNext: { [weak self] name in
              guard let name = name else {return}
//              print(name)
              self?.nameRoutine.accept(name)
            }).disposed(by: bag)
          //
          return cell
        } else {
          let cell = tableView.dequeueReusableCell(withIdentifier: "2", for: indexPath) as! TypeAddCell
          cell.typeLabel.text = "Type"
          
          return cell
        }
      case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: "3", for: indexPath) as! WarmUpBaseCell
        cell.titleLabel.text = "Warm Up"
        cell.circleView.backgroundColor = IntervalColor.yellow.color
        
        return cell
      case 2:
        if indexPath.row == 0 {
          let cell = tableView.dequeueReusableCell(withIdentifier: "4", for: indexPath) as! IntervalCycleCell
          
          return cell
        } else {
          let cell = tableView.dequeueReusableCell(withIdentifier: "5", for: indexPath) as! LowHighCell
          
          return cell
        }
      case 3:
        let cell = tableView.dequeueReusableCell(withIdentifier: "6", for: indexPath) as! RepeatCell
        
        return cell
      case 4:
        let cell = tableView.dequeueReusableCell(withIdentifier: "3", for: indexPath) as! WarmUpBaseCell
        cell.titleLabel.text = "Cool Down"
        cell.circleView.backgroundColor = IntervalColor.blue.color
        
        return cell
      default:
        return cell
      }
      
      
    }
  }
  
  // MARK: - Header+FooterSection
  
  extension AddEditViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return section == 0 ? 25 : CGFloat.leastNonzeroMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
      return 20
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 25))
      view.backgroundColor = #colorLiteral(red: 0.9333106875, green: 0.9372582436, blue: 0.9567168355, alpha: 1)
      return view
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
      let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
      view.backgroundColor = #colorLiteral(red: 0.9333106875, green: 0.9372582436, blue: 0.9567168355, alpha: 1)
      return view
    }
    
  }
