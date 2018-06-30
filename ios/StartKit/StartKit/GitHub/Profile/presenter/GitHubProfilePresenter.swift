//
//  GitHubProfilePresenter.swift
//  StartKit
//
//  Created by Xin Guo  on 2018/6/29.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

protocol GitHubProfilePresenter {
  func configureProfilePage(with userProfile: UserProfile, logoutAction: @escaping () -> Void)
  func configureEmptyPage()
}

class GitHubProfilePresenterImpl: GitHubProfilePresenter {
  weak var view: GitHubProfileView?
  
  init(view: GitHubProfileView) {
    self.view = view
  }
  
  func configureProfilePage(with userProfile: UserProfile, logoutAction: @escaping () -> Void) {
    let dataSource = GitHubProfileViewDataSource(userProfile: userProfile, menus: self.buildMenu(logout: logoutAction))
    self.view?.configure(with: dataSource)
  }
  
  func configureEmptyPage() {
    
  }
  
  private func buildMenu(logout: @escaping () -> Void) -> [GitHubProfileViewDataSource.MenuItem] {
    return [
      GitHubProfileViewDataSource.MenuItem(accessory: .disclosureIndicator, title: "Settings", color: .black, alignment: .left, action: nil),
      GitHubProfileViewDataSource.MenuItem(accessory: .none, title: "Logout", color: .red, alignment: .center, action: { logout() })
    ]
  }
}
