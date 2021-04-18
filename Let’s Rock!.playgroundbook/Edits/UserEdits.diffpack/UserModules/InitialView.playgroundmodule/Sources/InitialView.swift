import SwiftUI
import PlaygroundSupport
import AVFoundation

public struct ContentView: View {
    
    @State var isHoverYes = false
    @State var isHoverNo = false
    @State var texts = ["Are you sure? it's gonna be a great adventure!","Come on, you will like it!"]
    @State var cont = 0
    @State var isVisible = false
    var player : AVAudioPlayer?
    
    public init(){
        
        let fontURL = Bundle.main.url(forResource: "CHINESER", withExtension: "ttf")
        CTFontManagerRegisterFontURLs([fontURL!] as CFArray, CTFontManagerScope.process, true){ (errors, done) -> Bool in
            if(done) {
                
            }
            print(errors as Array)
            return true
        }
        guard let url = Bundle.main.url(forResource: "rock_face_rock_royalty_free_music_8739675520037487149", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)            
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            
            player?.prepareToPlay()
            guard let player = player else { return }
            player.volume = 0.1
            player.play()
            
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    public var body: some View {
        var noPickEffect = "noPick"
        var yesPickEffect = "yesPick"
        GeometryReader{ gp in
            ZStack(){
                Image(uiImage: UIImage(named: "topBg")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gp.size.width)
                    .position(x:gp.size.width * 0.50 ,y:gp.size.height * 0.09)
                Image(uiImage: UIImage(named: "bottomBg")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: gp.size.height)
                    .position(x:gp.size.width * 0.50 ,y:gp.size.height * 0.91)
                
                VStack(alignment: .center){
                    Spacer()
                    Text("Let's Talk About")
                        .font(Font.custom("Chinese Rocks", size: 100))
                        .foregroundColor(.black)
                    
                    HStack(alignment: .center){
                        Spacer()
                        Text("Rock?")
                            .font(Font.custom("Chinese Rocks", size: 100))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 150)
                    HStack(alignment: .center){
                        Button(action: {
                            switch cont {
                            case 0:
                                withAnimation(.easeInOut(duration:0.5)){
                                    isVisible.toggle() 
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        isVisible.toggle()
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        cont += 1
                                    }
                                }
                            case 1:
                                withAnimation(.easeInOut(duration:0.5)){
                                    isVisible.toggle() 
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        isVisible.toggle()
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        cont = 0
                                    }
                                    
                                }
                            default:
                                break 
                            }
                            
                            
                        }){
                            Image(uiImage: UIImage(named: "noPick")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 140, height: 140)
                                .shadow(radius: isHoverNo ? 5 : 0)
                                .animation(.spring())
                                .onHover { hoverN in
                                    isHoverNo = hoverN
                                }
                        }
                        
                        
                        Spacer()
                            .frame(width: 80)
                        Button(action: {
                            PlaygroundPage.current.navigateTo(page: .next)
                        }){
                            Image(uiImage: UIImage(named: "yesPick")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 140, height: 140)
                                .shadow(radius: isHoverYes ? 5 : 0)
                                .animation(.spring())
                                .onHover { hover in
                                    isHoverYes = hover
                                }
                        }
                    }
                    Spacer()
                        .frame(height:50)
                    Text(texts[cont])
                        .font(Font.custom("Chinese Rocks", size: 50))
                        .multilineTextAlignment(.center )
                        .foregroundColor(.black)
                        .animation(.default)
                        .opacity(isVisible ? 1 : 0)
                    Spacer()
                    
                }
            }.background(Color(#colorLiteral(red: 0.9603047966957092, green: 0.7802415490150452, blue: 0.5308190584182739, alpha: 1.0)))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        }
        
    
}



