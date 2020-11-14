//
//  GithubViewModel.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import Foundation
import RxSwift

class GithubViewModel: ObservableObject {
    
    private let githubService: GithubService = GithubServiceImpl()
    
    @Published var repositories: [GithubRepository] = []
    @Published var repositoriesErrorMessage: String = ""
    @Published var repositoriesIsLoading: Bool = false
    
    @Published var contributors: [GithubContributor] = []
    @Published var contributorsErrorMessage: String = ""
    @Published var contributorsIsLoading: Bool = false
    
    func fetchRepoByUsername(username: String) {
        self.repositoriesIsLoading = true
        githubService.getRepoByUsername(username, page: 1, perPage: 5)
            .subscribe(
                onNext: { data in
                    self.repositories = data
                    print("Data : \(data)")
                },
                onError: { error in
                    self.repositoriesErrorMessage = "Cannot Find This Username"
                    self.repositoriesIsLoading = false
                },
                onCompleted: {
                    self.repositoriesIsLoading = false
                }
        )
    }
    
    func fetchContributor(username: String, repoName: String) {
        githubService.getContributorByRepoName(username: username,
                                               repoName: repoName,
                                               page: 1,
                                               perPage: 5)
            .subscribe(
                onNext: { data in
                    self.contributors = data
                    print("Data : \(data)")
                },
                onError: { error in
                    self.contributorsErrorMessage = "Cannot Fetch Contributor"
                    self.contributorsIsLoading = false
                },
                onCompleted: {
                    self.contributorsIsLoading = false
                }
        )
    }
    
    
}
