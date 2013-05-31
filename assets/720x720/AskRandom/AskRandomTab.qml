import bb.cascades 1.0
import tb.ntb 1.0

Page {
    id: askRandomPage
    inputRoute.primaryKeyTarget: true
    titleBar: TitleBar {
                  appearance: TitleBarAppearance.Plain
                  title: qsTr("Ask Probability Of The Event")
              }
    Container {
        id: rootContainer
        layout: DockLayout {}
        background: backgroundDef.imagePaint
        Container {
            id: probabilityContainer
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            Label {
                text: qsTr("Tap Me To Get a Probability")
                multiline: true
                horizontalAlignment: HorizontalAlignment.Center
                textStyle {
                    textAlign: TextAlign.Center
                    base: SystemDefaults.TextStyles.BigText
                }
            }
            Label {
                id: outputLabel
                textStyle {
                    fontSize: FontSize.PointValue
                    fontSizeValue: 40
                }
                horizontalAlignment: HorizontalAlignment.Center
            }
            gestureHandlers: [
                TapHandler {
                    onTapped: {
                        outputLabel.textStyle.fontSize = FontSize.PointValue;
                        outputLabel.textStyle.fontSizeValue = 40;
                        var value = Math.ceil(Math.random() * 99);
                        outputLabel.text = (value < 10 ? "0" : "") + value + "%";
                        player.stop()
                        player.sourceUrl = "asset:///sounds/ask_me_tap.ogg"
                        player.playSound()
                    }
                }
            ]
            attachedObjects: [
                ImagePaintDefinition {
                    id: backgroundDef
                    imageSource: "asset:///images/probability_background.png"
                },
                SoundPlayer {
                    id: player
                    muteSound: false
                }
            ]
        } // probabilityContainer
    } // rootContainer
}
