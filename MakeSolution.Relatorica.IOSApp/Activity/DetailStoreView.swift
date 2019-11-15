import SwiftUI

struct DetailStoreView: View {
    var CapsuleButton = TokenButton(capsuleText: "Capsule")
    var historiesResponseVM: HistoriesResponseViewModel
    var body: some View {
        VStack(alignment: .leading){
            
            VStack(alignment: .center){
                Text(historiesResponseVM.nombre).font(Font.title.weight(.bold)).multilineTextAlignment(.center)
                
                URLImage(url: historiesResponseVM.imagen).shadow(radius: 10).frame(height: 200, alignment: .center).overlay(Rectangle().stroke(Color.white, lineWidth: 4)).padding(30)
                
            }
            Text(historiesResponseVM.argumento).multilineTextAlignment(.center).padding(.horizontal,40)
            
            Button(action: { }) {
                Text("Get by S/." + String(historiesResponseVM.precio))
            }.padding(.top,20).buttonStyle(self.CapsuleButton.buttonStyle)
        }
    }
}

//struct DetailStorieView_Previews: PreviewProvider {
    //static var previews: some View {
        //DetailStorieView()
    //}
//}
