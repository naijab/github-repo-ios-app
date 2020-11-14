//
//  SearchResultView.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import SwiftUI

struct SearchResultView: View {
    
    @ObservedObject private var githubViewModel = GithubViewModel()

    let keyword: String
    
    init(keyword: String) {
        self.keyword = keyword
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                if (githubViewModel.repositoriesIsLoading) {
                    ProgressView()
                }
                
                if (githubViewModel.repositoriesErrorMessage != "") {
                    Text(githubViewModel.repositoriesErrorMessage)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.red)
                }
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                    ForEach(githubViewModel.repositories, id: \.nodeID) { repo in
                        RepoItemView(repo: repo)
                            .padding(.bottom, 10)
                    }
                })
                .padding(.horizontal, 10)
                
            }.onAppear {
                self.githubViewModel.fetchRepoByUsername(username: keyword)
            }
        }
        .navigationBarTitle(keyword)
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(keyword: "Apple")
    }
}
