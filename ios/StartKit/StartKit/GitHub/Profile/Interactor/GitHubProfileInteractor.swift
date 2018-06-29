//
//  GitHubProfileInteractor.swift
//  StartKit
//
//  Created by Xin Guo  on 2018/6/29.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation
import RxSwift

protocol GitHubProfileInteractor {
  func loadUserProfile()
}

class GitHubProfileInteractorImpl: GitHubProfileInteractor {
  private let localStorage: LocalStorage
  private let disposeBag = DisposeBag()
  
  var presenter: GitHubProfilePresenter!
  
  init(localStorage: LocalStorage) {
    self.localStorage = localStorage
  }
  
  func loadUserProfile() {
    self.localStorage.queryOne(withMapper: UserMapper())
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { [weak self] user in
        guard let userProfile = user else {
          self?.presenter.configureEmptyPage()
          return
        }
        self?.presenter.configureProfilePage(with: userProfile)
        }, onError: { error in
          print("Local storage fetching user profile failed: \(error)")
      }).disposed(by: self.disposeBag)
  }
}
