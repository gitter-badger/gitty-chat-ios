//
//  WelcomeView.swift
//  GittyChat
//
//  Created by Nikhil John on 20/11/20.
//

import SwiftUI

struct WelcomeView: View {
    var gitter: Gitter
    var body: some View {
        VStack(alignment: .leading) {
            Text("Connect with people around the world")
                .modifier(TitleText())
                .padding()
                .padding(.top, 70)
            Spacer()
            VStack(alignment: .center) {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 35)
                    .padding([.leading, .trailing], 80)
                PrimaryButton(title: "Sign in with Gitter") {
                    gitter.openAuthURL()
                }
            }
            Spacer()
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(gitter: Gitter())
    }
}
