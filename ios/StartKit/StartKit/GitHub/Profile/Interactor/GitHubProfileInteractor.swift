//
//  GitHubProfileInteractor.swift
//  StartKit
//
//  Created by Xin Guo  on 2018/6/29.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import UIKit
import RxSwift

protocol GitHubProfileInteractor {
  func loadUserProfile()
  func logout()
}

class GitHubProfileInteractorImpl: NSObject, GitHubProfileInteractor, UITableViewDelegate {
  private let localStorage: LocalStorage
  private let keychainAccessor: KeychainAccessor
  private let disposeBag = DisposeBag()
  
  var presenter: GitHubProfilePresenter
  
  init(presenter: GitHubProfilePresenter, localStorage: LocalStorage, keychainAccessor: KeychainAccessor) {
    self.presenter = presenter
    self.localStorage = localStorage
    self.keychainAccessor = keychainAccessor
    super.init()
  }
  
  func loadUserProfile() {
    self.localStorage.queryOne(withMapper: UserMapper())
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { [weak self] user in
        guard let userProfile = user else {
          self?.presenter.configureEmptyPage()
          return
        }
        self?.presenter.configureProfilePage(with: userProfile, logoutAction: { self?.logout() })
        }, onError: { error in
          print("Local storage fetching user profile failed: \(error)")
      }).disposed(by: self.disposeBag)
  }
  
  func logout() {
    localStorage.deleteAllObjects(for: UserMapper().entityName)
    keychainAccessor.clearAccount()
    self.presenter.configureEmptyPage()
    NotificationCenter.default.post(name: Notification.Name.LoginStatusChangedNotificationName, object: nil)
  }
}
