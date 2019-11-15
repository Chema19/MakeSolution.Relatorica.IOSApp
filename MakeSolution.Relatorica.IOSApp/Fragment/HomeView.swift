import SwiftUI
import Combine

struct HomeView: View {
    
    
    let preference = UserDefaults.standard
    //@State var padreId: Int? = UserDefaults.standard.object(forKey:"PADREID") as? Int
    //@State var token: String? = UserDefaults.standard.object(forKey:"TOKEN") as? String
    
    @ObservedObject private var purchaseList = PurchaseListViewModel(padreId: UserDefaults.standard.object(forKey:"PADREID") as? Int, token: UserDefaults.standard.object(forKey:"TOKEN") as? String)
    
    var body: some View {
        NavigationView{
            List(self.purchaseList.purchasesResponseData, id: \.historiaId)
            { purchases in
                NavigationLink(destination: DetailPurchaseView(purchaseResponseVM: purchases, paragraphList: nil)) {
                    
                    VStack (alignment: .center, spacing: 1){
                        //URLImage(url: purchases.imagen).shadow(radius: 10).frame(height: 200, alignment: .center).overlay(Rectangle().stroke(Color.white, lineWidth: 4)).padding(15)
                        //Text(purchases.nombre).font(.title).padding(10)
                        CardViewHome(image: purchases.imagen, heading: purchases.nombre, author: purchases.editorial)
                    }
                }
            }
             .navigationBarTitle(Text("Purchased stories"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()	
    }
}
