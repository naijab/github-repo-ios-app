//
//  SearchResultView.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import SwiftUI

struct SearchResultView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject private var githubViewModel = GithubViewModel()

    let keyword: String
    
    init(keyword: String) {
        self.keyword = keyword
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                if (githubViewModel.repositoriesIsLoading) {
                    ProgressView()
                }
                
                if (githubViewModel.repositoriesErrorMessage != "") {
                    Text(githubViewModel.repositoriesErrorMessage)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.red)
                } else {
                    if (githubViewModel.repositories.count == 0) {
                        Text("No repository")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.red)
                    
                    } else {
                        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                            ForEach(githubViewModel.repositories, id: \.nodeID) { repo in
                                RepoItemView(repo: repo)
                                    .padding(.bottom, 10)
                            }
                        })
                        .navigationBarHidden(true)
                        .padding(.all, 10)
                    }
                }
            }
        }
        .navigationBarTitle(githubViewModel.profile.login, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
                Image(systemName: "arrow.left")
        })
        .onAppear {
            self.githubViewModel.fetchProfile(username: keyword)
            self.githubViewModel.fetchRepoByUsername(username: keyword)
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(keyword: "Apple")
    }
}
