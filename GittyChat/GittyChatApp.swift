//
//  GittyChatApp.swift
//  GittyChat
//
//  Created by Nikhil John on 20/11/20.
//

import SwiftUI

@main
struct GittyChatApp: App {
    var gitter = Gitter()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gitter)
                .onOpenURL { url in
                    if let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
                       let urlHost = components.host,
                       let params = components.queryItems {
                        if urlHost == gitter.client.host {
                            gitter.auth(code: params.first(where: { $0.name == "code" })?.value)
                        } else {
                            print(urlHost + " is invalid host")
                        }
                    }
                }
        }
    }
}
