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
  
  let bag = DisposeBag()
  let listRoutine = BehaviorRelay<[AddEditViewModel]>(value: [])
  
  
  
  // MARK: - Outlets
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet var tableView: UITableView!
  
  //  var headerView: HeaderRoutineTableView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.scrollView.delegate = self
    setUpTableView()
    
    let threeDaysLater = TimeInterval(3.days)
    //    date.addingTimeInterval(threeDaysLater)
    print(3.minutes)
    
    // Binding data
    tableView.rx.setDelegate(self).disposed(by: bag)
    
    listRoutine.asObservable()
      .bind(to: self.tableView.rx.items(cellIdentifier: cellID, cellType: ListCell.self)) {
        [weak self] (row, element, cell) in
        element.name.asObservable().subscribe(onNext: {
          title in
          cell.titleLabel.text = title
          
        })
      }.disposed(by: bag)
    
    
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
    tableView.register(nib, forCellReuseIdentifier: cellID)
    
    
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  //  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  //    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ListCell
  //
  ////    cell.titleLabel.text = "Untitled"
  ////
  ////    cell.timeLabel.text = "23:10"
  //
  //    return cell
  //  }
  
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
    handleTapButton()
    
  }
  
  func handleTapButton() {
    addButton.rx.tap.asDriver().throttle(0.5)
      .drive(onNext: { [weak self] _ in
        guard let self = self else {return}
        //        self.present(AddEditViewController(), animated: true, completion: nil)
        //        self.navigationController?.pushViewController(AddEditViewController(), animated: true)
        let navAddEditViewController: UINavigationController = UINavigationController(rootViewController: AddEditViewController())
        self.present(navAddEditViewController, animated: true, completion: nil)
      })
  }
}
