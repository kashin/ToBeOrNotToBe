import bb.cascades 1.0
import tb.ntb 1.0

Sheet {
    id: settingsSheet

    content: Page {
        titleBar: TitleBar {
            branded: TriBool.False
            acceptAction: ActionItem {
                title: qsTr("Close")
                onTriggered: {
                    settingsSheet.close();
                }
            }
        }

        Container {
            Label {
                text: qsTr("Use Flower's Sample Voice")
                multiline: true
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
                multiline: true
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

