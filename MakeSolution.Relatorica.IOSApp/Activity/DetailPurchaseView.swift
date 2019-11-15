import SwiftUI

struct DetailPurchaseView: View {
    
    var purchaseResponseVM: PurchaseResponseViewModel 
    //@State var paragraphListTest = ParagraphListViewModel(token: UserDefaults.standard.object(forKey:"TOKEN") as? String, historyId: purchaseResponseVM.historiaId)
    var paragraphList: ParagraphListViewModel! = nil
    
    
    
    var body: some View {
        VStack {
            NavigationView{
                URLImage(url: purchaseResponseVM.imagen).frame(height: 280, alignment: .center).edgesIgnoringSafeArea(.top)
                VStack(alignment: .leading){
                    Text(purchaseResponseVM.nombre).font(Font.title.weight(.bold)).multilineTextAlignment(.leading).padding(.horizontal,10).offset(y: -200).padding(.bottom,-130).foregroundColor(.white)
                }
                VStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.paragraphList.parrafosResponseData){ parrafo in
                                VStack(alignment: .leading) {
                                    Text(parrafo.texto)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading).padding(.horizontal,10)
                                }.frame(width:380, height: 200).clipped()
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct DetailPurchaseView_Previews: PreviewProvider {
    //static var previews: some View {
        //DetailPurchaseView()
    //}
//}


