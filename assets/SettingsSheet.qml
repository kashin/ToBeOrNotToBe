import bb.cascades 1.0
import tb.ntb 1.0

Sheet {
    id: settingsSheet

    content: Page {
        titleBar: TitleBar {
            appearance: TitleBarAppearance.Plain
            acceptAction: ActionItem {
                title: qsTr("Ok")
                onTriggered: {
                    settingsSheet.close();
                }
            }
        }

        Container {
            Label {
                text: qsTr("Use Flower's Sample Voice")
            }
            ToggleButton {
                id: flowerVoiceToggle
                checked: applicationSettings.useDefaultFlowerVoice
                onCheckedChanged: {
                    if (checked) {
                         applicationSettings.useDefaultFlowerVoice = true;
                    } else {
                        applicationSettings.useDefaultFlowerVoice = false;
                    }
                }
            }
            Label {
                id: leafsCountLabel
                text: qsTr("Maximum Leaf's Count: ") + leafCountSlider.value
            }
            Slider {
                id: leafCountSlider
                fromValue: 25
                toValue: 75
                value: applicationSettings.leafsCount
                onValueChanged: {
                    applicationSettings.leafsCount = value;
                    leafsCountLabel = qsTr("Maximum Leaf's Count: ") + value;
                }
            }
            Divider {
            }
            CheckBox {
                id: muteButton
                text: qsTr("Mute sounds")
                checked: applicationSettings.mute
                onCheckedChanged: {
                    applicationSettings.mute = checked
                }
            }
            Divider {
            }
        } // Container

        attachedObjects: [
            Settings {
                id: applicationSettings
            }
        ]
    } // Page
}

