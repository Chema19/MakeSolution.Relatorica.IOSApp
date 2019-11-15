import SwiftUI
import Combine

struct HomeView: View {
    let preference = UserDefaults.standard
    @ObservedObject private var purchaseList = PurchaseListViewModel(padreId: UserDefaults.standard.object(forKey:"PADREID") as? Int, token: UserDefaults.standard.object(forKey:"TOKEN") as? String)
    
    var body: some View {
        NavigationView{
            List(self.purchaseList.purchasesResponseData, id: \.historiaId)
            { purchases in
                NavigationLink(destination: DetailPurchaseView(purchaseResponseVM: purchases)) {
                    VStack (alignment: .center, spacing: 1){
                        CardViewHome(image: purchases.imagen, heading: purchases.nombre, author: purchases.editorial)
                    }
                }
            }
             .navigationBarTitle(Text("Purchased stories"))
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
    //static var previews: some View {
       // HomeView()
    //}
//}
