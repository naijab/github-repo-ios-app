//
//  GithubViewModel.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import Foundation
import RxSwift

class GithubViewModel: ObservableObject {
    
    @Published var repositories: [GithubRepository] = []
    @Published var errorMessage: String = "Something Wrong"
    @Published var isLoading: Bool = true
    
    func fetchByUsername(username: String) {
        GithubService().getRepoByUsername(username).subscribe(
            onNext: { data in
                self.repositories = data
                print("Data : \(data)")
            },
            onError: { error in
                self.errorMessage = "Cannot Find This Username"
                self.isLoading = false
            },
            onCompleted: {
                self.isLoading = false
            }
        )
    }
    
}
