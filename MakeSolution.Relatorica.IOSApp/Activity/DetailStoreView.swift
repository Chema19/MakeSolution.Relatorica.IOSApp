import SwiftUI

struct DetailStoreView: View {
    var CapsuleButton = TokenButton(capsuleText: "Capsule")
    var historiesResponseVM: HistoriesResponseViewModel
    @State private var showingAlert: Bool = false
    
    var body: some View {
         ScrollView{
        VStack(alignment: .leading){
            
            VStack(alignment: .center){
                Text(historiesResponseVM.nombre).font(Font.title.weight(.bold)).multilineTextAlignment(.center)
                
                URLImage(url: historiesResponseVM.imagen).shadow(radius: 10).frame(height: 200, alignment: .center).overlay(Rectangle().stroke(Color.white, lineWidth: 4)).padding(30)
                
            }
            Text(historiesResponseVM.argumento).multilineTextAlignment(.center).padding(.horizontal,40)
            
            Button(action: {
                AddPurchaseViewModel().postAddPurchase(padreId: UserDefaults.standard.object(forKey:"PADREID") as? Int, historiaId: self.historiesResponseVM.historiaId, costo: self.historiesResponseVM.precio, token: UserDefaults.standard.object(forKey:"TOKEN") as? String){
                    resulto in
                    if resulto!.addPurchaseResponse.Error == false {
                        self.showingAlert = true
                    }
                }
                
            }) {
                Text("Get by S/." + String(historiesResponseVM.precio))
            }.padding(.top,20).buttonStyle(self.CapsuleButton.buttonStyle).alert(isPresented: $showingAlert){
                  
                    switch showingAlert {
                        case true:
                            return Alert(title: Text("Success"), message: Text("purchase added"), dismissButton: .default(Text("OK!")))
                        case false:
                            return Alert(title: Text("Error"), message: Text("purchase fail"), dismissButton: .default(Text("OK!")))
                        }
                    }
            }
        }.padding(.top,20).edgesIgnoringSafeArea([.top])
    }
}

//struct DetailStorieView_Previews: PreviewProvider {
    //static var previews: some View {
        //DetailStorieView()
    //}
//}
