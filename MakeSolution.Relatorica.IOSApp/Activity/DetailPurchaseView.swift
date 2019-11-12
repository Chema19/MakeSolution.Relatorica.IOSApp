import SwiftUI

struct DetailPurchaseView: View {
    
    var purchaseResponseVM: PurchaseResponseViewModel
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .center){
                Text(purchaseResponseVM.nombre).font(Font.title.weight(.bold)).multilineTextAlignment(.center).padding(.horizontal,50)
                
                URLImage(url: purchaseResponseVM.imagen).shadow(radius: 10).frame(height: 200, alignment: .center).overlay(Rectangle().stroke(Color.white, lineWidth: 4)).padding(30)
            
            }
            Text(purchaseResponseVM.argumento).multilineTextAlignment(.center).padding(.horizontal,40)
        }
    }
}

//struct DetailPurchaseView_Previews: PreviewProvider {
    //static var previews: some View {
        //DetailPurchaseView()
    //}
//}


