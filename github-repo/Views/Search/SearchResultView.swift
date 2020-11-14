//
//  SearchResultView.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import SwiftUI

struct SearchResultView: View {
    
    @ObservedObject var githubViewModel = GithubViewModel()

    let keyword: String
    
    var body: some View {
        NavigationView {
            VStack {
                List(githubViewModel.repositories, id: \.nodeID) {repo in
                    RepoItemView(repo: repo)
                }
                .navigationBarTitle(keyword)
            }.onAppear {
                self.githubViewModel.fetchRepoByUsername(username: keyword)
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(keyword: "Apple")
    }
}
