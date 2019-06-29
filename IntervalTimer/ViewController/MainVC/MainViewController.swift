//
//  MainViewController.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/14/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
  
  let cellID = "Cell"
  let headerHeight: CGFloat = 30
  
  
  lazy var myRoutines : UILabel = {
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
    label.text = "My Routine"
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 14)
    
    return label
  }()
  
  lazy var headerView : UIView = {
    let view = UIView()
    view.addSubview(myRoutines)
    myRoutines.translatesAutoresizingMaskIntoConstraints = false
    myRoutines.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    myRoutines.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    return view
  }()
  lazy var addButton : UIButton = {
    let view = UIButton()
    view.setImage(#imageLiteral(resourceName: "icons8-plus"), for: .normal)
    
    //    view.tintColor = .black
    
    return view
  }()
  lazy var editButton: UIButton = {
    let view = UIButton()
    view.setTitle("Edit", for: .normal)
    view.setTitleColor(.black, for: .normal)
    view.tintColor = .black
    
    return view
  }()
  
  // RxSwift
  let bag = DisposeBag()
  var viewModel: MainViewModel!
//  var routineViewModel = RoutineViewModel(model: RoutineModel(title: <#T##String#>, timeModel: <#T##TimeModel#>), timeModel: <#T##TimeModel#>)
  
  
  init() {
//    self.viewModel = MainViewModel(navigator: self.navigationController)
    super.init(nibName: "MainViewController", bundle: nil)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Outlets
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var tableView: UITableView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.scrollView.delegate = self
    setUpTableView()
    
    self.viewModel = MainViewModel(navigator: self.navigationController!)
    let threeDaysLater = TimeInterval(3.days)
    print(3.minutes)
    
    tableView.rx.setDelegate(self)

    // Binding data
    bindData()
  }
  
  func bindData() {
    let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
      .mapToVoid()
    
    let input = MainViewModel.Input(trigger: viewWillAppear.asDriverOnErrorJustComplete(), editTrigger: editButton.rx.tap.asDriver(), createTrigger: addButton.rx.tap.asDriver(), routineViewModel: routineViewModel)
    
    let output = viewModel.transform(input: input)
    

//    output.routineViewModel.items.bind(to: tableView.rx.items(cellIdentifier: cellID, cellType: ListCell.self)) {
//      tableview, viewmodel, cell in
//      cell.bindData(viewmodel)
//    }
    output.routineViewModel.asObservable().bind(to: tableView.rx.items(cellIdentifier: cellID, cellType: ListCell.self)) {
      tableview, viewmodel, cell in
      cell.bindData(viewmodel)
    }
    
    output.startRoutine
      .drive()
      .disposed(by: bag)
//    output
    output.createRoutine
      .drive()
      .disposed(by: bag)
    
  }
  
}

extension MainViewController: UIScrollViewDelegate {
  func setupSlideScrollView() {
    
  }
  
}

extension MainViewController: UITableViewDelegate {
  
  
  func setUpTableView() {
    
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: "ListCell", bundle: bundle)
    tableView.register(nib, forCellReuseIdentifier: ListCell.cellId)
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    setUpHeaderView()
    return headerView
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
  
  
  
}

// Setup HeaderView
extension MainViewController {
  func setUpHeaderView() {
    headerView.addSubview(myRoutines)
    headerView.addSubview(addButton)
    headerView.addSubview(editButton)
    myRoutines.translatesAutoresizingMaskIntoConstraints = false
    addButton.translatesAutoresizingMaskIntoConstraints = false
    editButton.translatesAutoresizingMaskIntoConstraints = false
    
    // label
    myRoutines.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15).isActive = true
    myRoutines.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
    
    // add button
    addButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
    addButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true
    
    // edit button
    editButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
    editButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15).isActive = true
    
    // init Tapping
  }
  
  
}



extension ObservableType {
  
  func catchErrorJustComplete() -> Observable<Element> {
    return catchError { _ in
      return Observable.empty()
    }
  }
  
  func asDriverOnErrorJustComplete() -> Driver<Element> {
    return asDriver { error in
      return Driver.empty()
    }
  }
  
  func mapToVoid() -> Observable<Void> {
    return map { _ in }
  }
  
//  func mapToBool() -> Observable<Bool> {
//    return map {_ in}
//  }
}
