import bb.cascades 1.0
import tb.ntb 1.0

Page {
    id: askRandomPage
    Container {
        id: rootContainer
        layout: DockLayout {}
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Top
            Label {
                text: qsTr("Ask Probability Of The Event")
                multiline: true
                horizontalAlignment: HorizontalAlignment.Center
                textStyle {
                    textAlign: TextAlign.Center
                    base: SystemDefaults.TextStyles.TitleText
                }
            }
            Divider {
            }
        }
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
                gestureHandlers: [
                    TapHandler {
                        onTapped: {
                            outputLabel.textStyle.fontSize = FontSize.PointValue;
                            outputLabel.textStyle.fontSizeValue = 40;
                            var value = Math.ceil(Math.random() * 100);
                            outputLabel.text = (value < 10 ? "0" : "") + value + "%";
                        }
                    }
                ]
            }
            Label {
                id: outputLabel
                textStyle {
                    fontSize: FontSize.PointValue
                    fontSizeValue: 40
                }
                horizontalAlignment: HorizontalAlignment.Center
            }
        } // probabilityContainer
    } // rootContainer
}
