//
//  ViewController.swift
//  StartKit
//
//  Created by XueliangZhu on 9/24/16.
//  Copyright © 2016 ThoughtWorks. All rights reserved.
//

import UIKit
import RxSwift

extension NSNotification.Name {
  static let LoginStatusChangedNotificationName = NSNotification.Name("LoginStatusChangedNotificationName")
}

class ContainerViewController: UIViewController {
  let loaclStorage = CoreDataLocalStorage()
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    showHomeViewController()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    showLoginViewControllerIfNeeded()
    NotificationCenter.default.addObserver(self, selector: #selector(showLoginViewControllerIfNeeded), name: Notification.Name.LoginStatusChangedNotificationName, object: nil)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    NotificationCenter.default.removeObserver(self)
  }
  
  func showLoginViewController() {
    guard let viewController = UIStoryboard(name: "GitHubLogin", bundle: nil).instantiateViewController(withIdentifier: "GitHubLoginViewController") as? GitHubLoginViewController else {
      return
    }
    GitHubLoginConfiguration.configure(viewController: viewController)
    viewController.dismiss = {
      viewController.dismiss(animated: true, completion: nil)
    }
    present(viewController, animated: true, completion: nil)
  }
  
  func showHomeViewController() {
    guard let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() else {
      return
    }
    viewController.willMove(toParentViewController: self)
    addChildViewController(viewController)
    view.addSubview(viewController.view)
    viewController.didMove(toParentViewController: self)
  }
  
  @objc func showLoginViewControllerIfNeeded() {
    loaclStorage.queryOne(withMapper: UserMapper())
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { [unowned self] userProfile in
        if userProfile == nil {
          self.showLoginViewController()
        }
      }, onError: { error in
        print("CoreData fetch user failed: \(error)")
      }).disposed(by: disposeBag)
  }
}
