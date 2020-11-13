//
//  ContributorItem.swift
//  github-repo
//
//  Created by Nattapon Pondongnok on 14/11/2563 BE.
//

import SwiftUI

struct ContributorItem: View {
    let title: String
    let avatar: String
    
    var body: some View {
        VStack {
            Text(title)
            RemoteImage(url: avatar)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .padding()
        .background(Color.contributorBg)
        .cornerRadius(6)
    }
}

struct ContributorItem_Previews: PreviewProvider {
    static var previews: some View {
        ContributorItem(
            title: "Demo C",
            avatar: "https://picsum.photos/200/300"
        )
    }
}
