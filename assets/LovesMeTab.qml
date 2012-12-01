import bb.cascades 1.0
import bb.multimedia 1.0
import tb.ntb 1.0

Page {
    id: lovesMeTab
    function resetFlower() {
        infoLabel.text = qsTr("Loves Me Or Not?");
        flower.resetFlower();
    }
    actions: [
        ActionItem {
            title: qsTr("Try again")
            imageSource: "asset:///images/reset_flower_action_icon.png"
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
        Label {
            horizontalAlignment: HorizontalAlignment.Center
            text: qsTr("Loves Me Or Not")
            textStyle {
                base: SystemDefaults.TextStyles.TitleText
            }
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
                infoLabel.text = text;

                if (!applicationSettings.mute) {
                    var source;
                    if (applicationSettings.useDefaultFlowerVoice) {
                        source = applicationSettings.flowerVoiceDefault
                               + (lovesMe ? "1.WAV": "2.WAV");
                    } else {
                        source = applicationSettings.flowerVoice
                               + (lovesMe ? "1.WAV": "2.WAV");
                    }
                    media.setSourceUrl( source );
                    media.play();
                }
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
            MediaPlayer {
                id: media
            }
    ]
}
