import SwiftUI
import Charts

struct LiveCryptoView: View {

    @State private var points: [CryptoPoint] = []
    private let socket = BinanceWebSocketManager()

    var body: some View {
        VStack {

            Text("Bitcoin (Tempo Real)")
                .font(.title2)

            Chart(points) { item in
                LineMark(
                    x: .value("Tempo", item.time),
                    y: .value("Preço", item.price)
                )
                .foregroundStyle(.orange)

                PointMark(
                    x: .value("Tempo", item.time),
                    y: .value("Preço", item.price)
                )
                .foregroundStyle(.orange)
            }
            .frame(height: 300)
            .padding()

        }
        .onAppear {
            socket.onPriceUpdate = { price in
                let newPoint = CryptoPoint(time: Date(), price: price)

                points.append(newPoint)

                if points.count > 20 {
                    points.removeFirst()
                }
            }

            socket.connect(symbol: "btcusdt")
        }
        .onDisappear {
            socket.disconnect()
        }
        .padding()
    }
}

struct LiveCryptoView_Previews: PreviewProvider {
    static var previews: some View {
        LiveCryptoView()
    }
}
