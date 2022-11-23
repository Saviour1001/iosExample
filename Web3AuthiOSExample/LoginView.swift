//
//  LoginView.swift
//  Web3AuthiOSExample
//
//  Created by Harsh Ghodkar on 20/11/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm: ViewModel
    var body: some View {
        List {
            Button(
                action: {
                    vm.login()
                },
                label: {
                    Text("Sign In")
                }
            )

            Button(
                action: {
                    vm.login(provider: .GOOGLE)
                },
                label: {
                    Text("Sign In with Google")
                }
            )

            Button(
                action: {
                    vm.login(provider: .APPLE)
                },
                label: {
                    Text("Sign In with Apple")
                }
            )

//            Button(
//                action: {
//                    vm.whitelabelLogin()
//                },
//                label: {
//                    Text("Sign In with Whitelabel")
//                }
//            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(vm: ViewModel())
    }
}
