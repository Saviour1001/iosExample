//
//  UserDetailView.swift
//  Web3AuthiOSExample
//
//  Created by Harsh Ghodkar on 20/11/22.
//

import SwiftUI
import Web3Auth
import web3

struct UserDetailView: View {
    @State var user: Web3AuthState?
    @Binding var loggedIn: Bool
    @State private var showingAlert = false
    @StateObject var web3RPC: Web3RPC
    var body: some View {
        if let user = user {
            List {
                Section {
                    Text("\(user.privKey ?? "")")
                } header: {
                    Text("Private key")
                }
                Section {
                    Text("Name \(user.userInfo?.name ?? "")")
                    Text("Email \(user.userInfo?.email ?? "")")
                }
                header: {
                    Text("User Info")
                }
                Section{
                   Button {
                       web3RPC.getBalance()

                   } label: {
                       HStack{
                           Text("Get Balance")
                           Spacer()
                           Text("\(web3RPC.balance)")
                       }
                   }
                }  
                header: {
                    Text("Blockchain Calls")
                }
                
                
                Section {
                    Button {
                        Task.detached {
                            do {
                                try await Web3Auth().logout()
                                await MainActor.run(body: {
                                    loggedIn.toggle()
                                })                             } catch {
                                DispatchQueue.main.async {
                                    showingAlert = true
                                }
                            }
                        }
                    } label: {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Error"), message: Text("Logout failed!"), dismissButton: .default(Text("OK")))
                    }
                }
            }
            .listStyle(.automatic)
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let user: Web3AuthState = .init(privKey: "12345", ed25519PrivKey: "32334", sessionId: "23234384y7735y47shdj", userInfo: nil, error: nil)
        UserDetailView(user: user , loggedIn: .constant(true), web3RPC: .init(user: user)!)
    }
}
