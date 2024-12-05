import Foundation
import SwiftUI

struct CardMusicComponent: View {
    
    var arrayMusica: [Musica] = []
    var onClickInPlay: (Musica) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("LIST OF SONGS")
                .font(.system(size: 14))
                .foregroundColor(Color.colorTextSlider)
            
            ForEach(Array(arrayMusica.enumerated()), id: \.element.id) { index, musica in
                HStack {
                    // Número dinámico, formateado con dos dígitos
                    Text(String(format: "%02d", index + 1))
                        .foregroundColor(Color.colorTextSlider)
                    
                    Button(action: {
                        onClickInPlay(musica)
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.black.opacity(0.5))
                                .frame(width: 40, height: 40)
                            if(musica.bloqueado == true){
                                Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                    .frame(width: 24, height: 24)
                            } else {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.white)
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }
                    .padding(8)
                    Text(musica.titulo)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    Spacer()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.colorBoton)
        .cornerRadius(12)
    }
}
