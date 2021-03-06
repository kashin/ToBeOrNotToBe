import bb.cascades 1.0
import tb.ntb 1.0

Page {
    id: lovesMeTab
    titleBar: TitleBar {
                  appearance: TitleBarAppearance.Plain
                  title: qsTr("Loves Me Or Not")
              }
    function resetFlower() {
        flower.resetFlower();
        infoLabel.text = qsTr("Loves Me Or Not?");
    }
    actions: [
        ActionItem {
            title: qsTr("Try again")
            imageSource: "asset:///images/flower_icon.png"
            onTriggered: {
                lovesMeTab.resetFlower();
            }
        }
    ]
    // main container of the page
    Container {
        touchPropagationMode: TouchPropagationMode.Full
        layout: StackLayout {
        }
        Button {
            text: qsTr("Try again")
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            onClicked: {
                lovesMeTab.resetFlower();
            }
        }
        Divider {
        }
        Label {
            id: infoLabel
            horizontalAlignment: HorizontalAlignment.Center
            text: qsTr("Loves Me Or Not?")
            textStyle {
                base: SystemDefaults.TextStyles.BigText
            }
        }
        Flower {
            id: flower
            onLovesMeTextChanged: {
                infoLabel.text = flower.lovesMeText;
                var source = lovesMe ? "asset:///sounds/leaf_loves.wav" :
                                       "asset:///sounds/leaf_loves_not.wav"
                player.muteSound = !applicationSettings.useDefaultFlowerVoice;
                player.setSourceUrl( source );
                player.playSound();
            }
        }
    }
    onCreationCompleted: {
        resetFlower();
    }
    attachedObjects: [
            Settings {
                id: applicationSettings
            },
            SoundPlayer {
                id: player
                muteSound: !applicationSettings.useDefaultFlowerVoice
            }
    ]
}
