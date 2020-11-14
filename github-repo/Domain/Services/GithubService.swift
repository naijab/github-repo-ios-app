//
//  GithubService.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import Foundation
import RxSwift

protocol GithubService {
    func getRepoByUsername(
            _ username : String,
            page: Int,
            perPage: Int) -> Observable<[GithubRepository]>
    
    func getContributorByRepoName(
            username: String,
            repoName: String,
            page: Int,
            perPage: Int) -> Observable<[GithubContributor]>
}
