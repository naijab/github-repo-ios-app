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
            RemoteImage(url: avatar)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(title)
                .font(.caption)
        }
        .padding(.all, 10)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.contributorBg)
        .cornerRadius(8)
    }
}

struct ContributorItem_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ContributorItem(
                title: "Demo C",
                avatar: "https://picsum.photos/200/300"
            )
            ContributorItem(
                title: "DemoC",
                avatar: "https://picsum.photos/200/300"
            )
        }
    }
}
