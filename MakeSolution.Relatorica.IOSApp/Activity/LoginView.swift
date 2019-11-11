import SwiftUI

enum ActiveAlert {
    case first, second
}

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
  
    @State var showLoginView: Bool = false
    @State private var showingAlert: Bool = false
    @State private var activeAlert: ActiveAlert = .first
    
    @State var loginViewModel: LoginViewModel! = nil
    
    var lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    var CapsuleButton = TokenButton(capsuleText: "Capsule")
    var TextButton = TokenButton(buttonText: "Text")
  
    
    var body: some View {
            VStack {
                if showLoginView {
                    ContentView().animation(.spring())
                    .transition(.slide)
                } else {
                    Text("Relatorica").padding(.top,40).font(Font.title.weight(.bold))
                            Image("login")
                               .clipShape(Rectangle()) .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                               .shadow(radius: 10).padding(.top,30)
                           
                           HStack {
                                Image("user").foregroundColor(.red)
                                    .shadow(radius: 10).frame(width: 32.0, height: 32.0)
                            
                                 TextField("Enter username", text:$username).padding(.all)
                                .background(lightGreyColor).cornerRadius(5.0)
                            
                           }.padding(.horizontal,28).padding(.top,30)
                    
                           HStack {
                                Image("key").foregroundColor(.red)
                                    .shadow(radius: 10).frame(width: 32.0, height: 32.0)
                                
                                TextField("Enter passsword", text:$password).padding(.all)
                                .background(lightGreyColor).cornerRadius(5.0)
                           }.padding(.horizontal,28)
                     
                            Button(action: {
                                if self.username != "" && self.password != "" {
                                    LoginViewModel().postLogin(username: self.username, password: self.password){
                                        resulto in
                                        if resulto!.loginResponse.Error == false {
                                            let preferences = UserDefaults.standard
                                            preferences.set(resulto!.loginResponse.Data.PersonId, forKey: "PADREID")
                                            preferences.set("Bearer " + resulto!.loginResponse.Data.Token, forKey: "TOKEN")
                                            self.showLoginView = true
                                        }else{
                                            self.activeAlert = .second
                                            self.showingAlert = true
                                        }
                                    }
                                }else{
                                    self.activeAlert = .first
                                    self.showingAlert = true
                                }
                            }) {
                                Text("Enter")
                            }
                            .padding(.top,20).buttonStyle(self.CapsuleButton.buttonStyle).alert(isPresented: $showingAlert){
                                switch activeAlert {
                                case .first:
                                    return Alert(title: Text("Error"), message: Text("username or password empty, Add credentials"), dismissButton: .default(Text("Got it!")))
                                case .second:
                                    return Alert(title: Text("Error"), message: Text("Incorrect Account"), dismissButton: .default(Text("Got it!")))
                                }
                            }
                    
                            Button(action: {
                                
                            }) {
                                Text("Registrar usuario")
                            }.padding(.top,20)
                    
                            Spacer()
                }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



