import SwiftUI
import Combine

struct HomeView: View {
    
    
    let preference = UserDefaults.standard
    @State var padreId: Int? = UserDefaults.standard.object(forKey:"PADREID") as? Int
    @State var token: String? = UserDefaults.standard.object(forKey:"TOKEN") as? String
    
    @ObservedObject private var purchaseList = PurchaseListViewModel(padreId: UserDefaults.standard.object(forKey:"PADREID") as? Int, token: UserDefaults.standard.object(forKey:"TOKEN") as? String)
    
    var body: some View {
        List(self.purchaseList.purchasesResponseData, id:\.historiaId)
        { purchases in
            VStack(alignment: .leading){
               
                Text(purchases.nombre).font(.title)
                Text(purchases.argumento)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()	
    }
}
