//
//  GitHubProfileConfiguration.swift
//  StartKit
//
//  Created by Xin Guo  on 2018/6/30.
//  Copyright © 2018 ThoughtWorks. All rights reserved.
//

import Foundation

class GitHubProfileConfiguration {
  class func configure(viewController: GitHubProfileViewController) {
    let presenter = GitHubProfilePresenterImpl(view: viewController)
    let localStorage = CoreDataLocalStorage()
    let interactor = GitHubProfileInteractorImpl(presenter: presenter, localStorage: localStorage, keychainAccessor: KeychainAccessor())
    viewController.interactor = interactor
  }
}
