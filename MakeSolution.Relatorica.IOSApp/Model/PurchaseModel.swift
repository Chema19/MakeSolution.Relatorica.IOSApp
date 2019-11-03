import Foundation

struct PurchaseModel: Codable
{
    let CompraId: Int
    let PadreId: Int
    let HistoriaId: Int
    let FechaCompra: String
    let Estado: String
    let Costo: Double
}
		
