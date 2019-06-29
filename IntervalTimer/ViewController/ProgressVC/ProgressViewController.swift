//
//  ProgressViewController.swift
//  IntervalTimer
//
//  Created by Lê Toàn on 6/25/19.
//  Copyright © 2019 Lê Toàn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MBCircularProgressBar

class ProgressViewController: UIViewController {
  
  let bag = DisposeBag()
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var elapsedLabel: UILabel!
  @IBOutlet weak var remainingLabel: UILabel!
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var belowView: UIView!
  @IBOutlet weak var progressView: MBCircularProgressBarView!
  @IBOutlet weak var lockButton: UIButton!
  @IBOutlet weak var discardButton: UIButton!
  
  lazy var cancelButton : UIButton = {
    let view = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    view.setImage(#imageLiteral(resourceName: "icons8-multiply"), for: .normal)
    
    return view
  }()
  
  lazy var editButton : UIButton = {
    let view = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    view.setTitle("Edit", for: .normal)
    
    return view
  }()
  
  var recentTimer = Timer()
  var elapsedTimer = Timer()
  var remainTimer = Timer()
  
  let viewModel: ProgressViewModel!
  
  var cgImage = CIImage(image: UIImage(named: "icons8-back-white")!)?.convertCIImageToCGImage()
  
  
  //FIXME: fix here
  var time = "10:30"
  var elapsedTime = "00:00"
  var totalTime = "30:00"
  var isStart = false
  
  //  let timeDemo = BehaviorRelay<String>(value: "10:30")
  //  let elapsedTimeDemo = BehaviorRelay<String>(value: "00:00")
  //  let sumTimeDemo = BehaviorRelay<String>(value: "1:00:00")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.bringSubviewToFront(startButton)
    timeLabel.rx.text.onNext(String(time))
    handleTapButton()
    setUpNavigation()
    
    //FIXME: fix here
    let image = UIImage(cgImage: self.cgImage! , scale: 1.8, orientation: .upMirrored)
    nextButton.setImage(image, for: .normal)
    
    view.backgroundColor = ThemeType.warmUp.themes
    belowView.backgroundColor = ThemeType.warmUpBelow.themes
    
    
    progressView.value = 0
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    UIView.animate(withDuration: 10.0) {
      self.progressView.value = 50
    }
  }
  @IBAction func percentSliderValueChanged(sender: UISlider) {
    progressView.value = CGFloat(sender.value) * 100
    print(sender.value)
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.viewModel = ProgressViewModel()
    super.init(nibName: "ProgressViewController", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func bindData()  {
    //    let input = ProgressViewModel.Input(startAction: startButton.rx.tap.asDriver(), time: timeDemo.asDriver(), elapsedTime: elapsedTimeDemo.asDriver(), remainingTime: sumTimeDemo.asDriver())
    //    let ouput = viewModel.transform(input: input)
    //      ouput.timeStart.drive(onNext: {
    //        self.timeLabel.text = $0
    //      })
  }
  func setUpNavigation() {
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelButton)
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: editButton)
    self.navigationController?.navigationBar.backgroundColor = ThemeType.warmUp.themes
    self.navigationController?.navigationBar.barTintColor = ThemeType.warmUp.themes
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.tintColor = UIColor.white
    self.navigationController?.navigationBar.isTranslucent = false
  }
  
  
  
  func handleTapButton() {
    startButton.rx.tap.scan(false) { lastState, newValue in
      return !lastState
      }
      .subscribe(onNext: {value in
        value ? self.startButton.setTitle("Stop", for: .normal) : self.startButton.setTitle("START", for: .normal)
        value ? self.start() : self.stop()
      }).disposed(by: bag)
    
    lockButton.rx.tap.scan(false) { last, new in
      return !last
      }
      .subscribe(onNext: { value in
        value ? self.lockButton.setImage(#imageLiteral(resourceName: "icons8-lock_2_filled"), for: .normal) : self.lockButton.setImage(#imageLiteral(resourceName: "icons8-unlock_2"), for: .normal)
        self.disableAllButton(value)
      })
  }
  
  func disableAllButton(_ value: Bool) {
    if value {
      nextButton.isEnabled = false
      backButton.isEnabled = false
      discardButton.isEnabled = false
      editButton.isEnabled = false
    } else {
      nextButton.isEnabled = true
      backButton.isEnabled = true
      discardButton.isEnabled = true
      editButton.isEnabled = true
    }
  }
  
  // MARK: - Logic Function
  
  func start() {
    recentTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    
    elapsedTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCount), userInfo: nil, repeats: true)
    
    remainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(totalCountDown), userInfo: nil, repeats: true)
  }
  
  func stop() {
    recentTimer.invalidate()
    elapsedTimer.invalidate()
    remainTimer.invalidate()
  }
  
  @objc
  func countDown() {
    var timeCount = time.getTotalToSecond()
    if timeCount != 0 {
      timeCount -= 1
    } else {
      
    }
    time = secondsToHoursMinutesSeconds(timeCount)
    timeLabel.text = time
    
  }
  
  @objc
  func totalCountDown() {
    var timeCountRemaining = totalTime.getTotalToSecond()
    if timeCountRemaining != 0 {
      timeCountRemaining -= 1
    } else {
      
    }
    totalTime = secondsToHoursMinutesSeconds(timeCountRemaining)
    remainingLabel.text = totalTime
  }
  
  @objc
  func startCount() {
    var timeCount = elapsedTime.getTotalToSecond()
    timeCount += 1
    elapsedTime = secondsToHoursMinutesSeconds(timeCount)
    elapsedLabel.rx.text.onNext(elapsedTime)
    
  }
  
  func secondsToHoursMinutesSeconds(_ seconds: Int) -> String {
    if seconds < 10 {
      return "00:" + "0\(seconds)"
    } else if seconds >= 10 && seconds < 60 {
      return "00:" + "\(seconds)"
    }
    
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    
    return formatter.string(from: TimeInterval(seconds))!
  }
  
  
  
}








