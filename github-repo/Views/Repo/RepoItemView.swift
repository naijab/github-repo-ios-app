//
//  RepoItemView.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import SwiftUI

struct RepoItemView: View {
    
    let repo: GithubRepository

    init(repo: GithubRepository) {
        self.repo = repo
        print(repo)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            Text(repo.name)
                .foregroundColor(Color.primary)
                .font(.title)
                .bold()
          
//            Text(\.repo.stargazersCount)
//                .foregroundColor(Color.gray)
            
//            ScrollView (.horizontal, showsIndicators: false) {
//                HStack {
//                    ContributorItem(title: "Apple", avatar: "https://picsum.photos/200/300")
//                    ContributorItem(title: "Apple 2", avatar: "https://picsum.photos/200/300")
//                    ContributorItem(title: "Apple 3", avatar: "https://picsum.photos/200/300")
//                    ContributorItem(title: "Apple 3", avatar: "https://picsum.photos/200/300")
//                    ContributorItem(title: "Apple 3", avatar: "https://picsum.photos/200/300")
//                    ContributorItem(title: "Apple 3", avatar: "https://picsum.photos/200/300")
//                }
//            }
//            .frame(height: 120)
        })
        .cornerRadius(10)
        .padding(.vertical, 10)
        .padding(.leading, 10)
        .background(Color.repoBg)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.5),
                        lineWidth: 1)
        )
    }
}

//struct RepoItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        RepoItemView(repo: GithubRepositor(
//        
//        ))
//    }
//}
