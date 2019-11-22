import SwiftUI
import Combine

struct HomeView: View {
    let preference = UserDefaults.standard
    @ObservedObject private var purchaseList = PurchaseListViewModel(padreId: UserDefaults.standard.object(forKey:"PADREID") as? Int, token: UserDefaults.standard.object(forKey:"TOKEN") as? String)
    
    var body: some View {
        NavigationView{
            List(self.purchaseList.purchasesResponseData, id: \.historiaId){ purchases in
                NavigationLink(destination: DetailPurchaseView(purchaseResponseVM: purchases,paragraphListVM: ParagraphListViewModel(token: self.preference.object(forKey: "TOKEN") as? String, historyId: purchases.historiaId) )) {
                    StoryRowView(image: purchases.imagen, heading: purchases.nombre, author: purchases.editorial)
                }
            }.navigationBarTitle(Text("Purchased stories"))
            /*NavigationButton(destination: Text("detail 2")) {
                               Text("row 2")
                           }*/
        }//.edgesIgnoringSafeArea([.all])
    }
}
