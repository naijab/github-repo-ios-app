//
//  GithubService.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import Foundation
import RxSwift
import Alamofire

class GithubServiceImpl: GithubService {
    
    private let baseUrl = "https://api.github.com"

    func getRepoByUsername(_ username : String, page: Int = 1, perPage: Int = 5) -> Observable<[GithubRepository]> {
            return Observable<[GithubRepository]>.create { observer in
                AF.request("\(self.baseUrl)/users/\(username)/repos?page=\(page)&per_page=\(perPage)",
                           method: .get, encoding: JSONEncoding.default, headers: nil)
                    .validate()
                    .response { response in
                        print("=>> Fetch! Repo Start")
                        guard let responseData = response.data else {
                            return observer.onCompleted()
                        }
                        do {
                            let model = try JSONDecoder()
                                .decode([GithubRepository].self,
                                        from: responseData)
                            print("=>> Fetch! Repo Data : \(model.count)")
                            observer.onNext(model)
                            observer.onCompleted()
                        } catch {
                            observer.onError(error)
                            print("=>> Featch! Repo Error: \(error)")
                            observer.onCompleted()
                        }
                    }
            return Disposables.create()
        }
    }
    
    func getContributorByRepoName(
            username: String,
            repoName: String,
            page: Int = 1,
            perPage: Int = 5) -> Observable<[GithubContributor]> {
            return Observable<[GithubContributor]>.create { observer in
                AF.request("\(self.baseUrl)/repos/\(username)/\(repoName)/contributors?page=\(page)&per_page=\(perPage)",
                           method: .get, encoding: JSONEncoding.default, headers: nil)
                    .validate()
                    .response { response in
                        print("=>> Fetch! Contributor Start ===> \(username)")
                        guard let responseData = response.data else {
                            return observer.onCompleted()
                        }
                        
                        do {
                            let model = try JSONDecoder()
                                .decode([GithubContributor].self,
                                        from: responseData)
                            print("=>> Fetch! Contributor Data : \(model.count)")
                            observer.onNext(model)
                            observer.onCompleted()
                        } catch {
                            observer.onError(error)
                            print("=>> Featch! Contributor Error: \(error)")
                            observer.onCompleted()
                        }
                    }
            return Disposables.create()
        }
    }
    
}
