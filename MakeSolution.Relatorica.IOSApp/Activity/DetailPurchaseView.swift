import SwiftUI
import Combine

struct DetailPurchaseView: View {
    
    var purchaseResponseVM: PurchaseResponseViewModel
    @ObservedObject var paragraphListVM: ParagraphListViewModel
    @ObservedObject var imageLoader = ImageLoader()
    @ObservedObject var sonido = SoundViewModel()
    var CapsuleButton = TokenButton(capsuleText: "Capsule")
    
    var body: some View {
        NavigationView {
        ScrollView{
            Group {
                    ZStack {
                        if (imageLoader.image != nil) {
                                Image(uiImage: self.imageLoader.image!)
                                    .resizable().frame(height: 280)
                        }
                    }.onAppear {
                        if let url = URL(string: self.purchaseResponseVM.imagen) {
                            self.imageLoader.downloadImage(url: url)
                        }
                    }
                    Section {
                        Text(purchaseResponseVM.nombre)
                            .font(.title)
                            .multilineTextAlignment(.leading).padding(.horizontal,10)
                        VStack {
                            NavigationLink(destination: AddFatherView()) {
                                Text("Dinamicas")
                            }.padding(.top,10).buttonStyle(self.CapsuleButton.buttonStyle)
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(paragraphListVM.parrafosResponseData, id: \.ParrafoId){ parrafo in
                                    VStack(alignment: .leading) {
                                        ScrollView{
                                            Text(parrafo.Texto)
                                                .foregroundColor(.primary)
                                                .multilineTextAlignment(.leading).padding(.horizontal,10)
                                            
                                            Button(action: {
                                                //SoundViewModel().getSoundData(token: //(UserDefaults.standard.object(forKey:"TOKEN") as? String)!, soundId: //parrafo.SonidoId){ resultado in
                                                self.sonido.playSound()
                                                //}
                                            }) {
                                                Text("Emitir Sonido")
                                            }.padding(.top,20)
                                        }
                                    }.frame(width:380, height: 300).clipped()
                                }
                            
                            }
                        }
                        
                    }
                
            }
        }.edgesIgnoringSafeArea([.top])
        }
    }
}

struct PosterView: View {
    
    var image: UIImage?
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .aspectRatio(500/750, contentMode: .fit)
            
            if (image != nil) {
                Image(uiImage: self.image!)
                    .resizable()
                    .aspectRatio(500/750, contentMode: .fit).frame(height: 280, alignment: .center)
            }
        }
    }
}
