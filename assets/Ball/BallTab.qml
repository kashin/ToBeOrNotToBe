import bb.cascades 1.0
import tb.ntb 1.0

Page {

    titleBar: TitleBar {
        appearance: TitleBarAppearance.Plain
        title: qsTr("Ask me...")
    }
    id: magicBall

    Container {
        id: ballContainer
        background: ballBackground.imagePaint
        layout: DockLayout {}

        function updateAnswerText() {
            switch(Math.ceil(Math.random()*16)) {
                case 0: {
                    firstLabel.text = qsTr("It")
                    secondLabel.text = qsTr("is")
                    thirdLabel.text = qsTr("certain!")
                    break;
                }
                case 1: {
                    firstLabel.text = qsTr("Most")
                    secondLabel.text = qsTr("")
                    thirdLabel.text = qsTr("likely!")
                    break;
                }
                case 2: {
                     firstLabel.text = ""
                     secondLabel.text = qsTr("Yep!")
                     thirdLabel.text = ""
                    break;
                }
                case 3: {
                     firstLabel.text = ""
                     secondLabel.text = qsTr("Nope.")
                     thirdLabel.text = ""
                    break;
                }
                case 4: {
                    firstLabel.text = qsTr("I am")
                    secondLabel.text = qsTr("not")
                    thirdLabel.text = qsTr("sure.")
                    break;
                }
                case 5: {
                    firstLabel.text = ""
                    secondLabel.text = qsTr("Maybe.")
                    thirdLabel.text = ""
                    break;
                }
                case 6: {
                    firstLabel.text = ""
                    secondLabel.text = qsTr("Yes!")
                     thirdLabel.text = ""
                    break;
                }
                case 7: {
                    firstLabel.text = ""
                    secondLabel.text = qsTr("No.")
                    thirdLabel.text = ""
                    break;
                }
                case 8: {
                    firstLabel.text = qsTr("Ask")
                    secondLabel.text = qsTr("me")
                    thirdLabel.text = qsTr("later.")
                    break;
                }
                case 9: {
                    firstLabel.text = qsTr("Think")
                    secondLabel.text = ""
                    thirdLabel.text = qsTr("twise!")
                    break;
                }
                case 10: {
                    firstLabel.text = qsTr("Signs")
                    secondLabel.text = qsTr("point")
                    thirdLabel.text = qsTr("to yes!")
                    break;
                }
                case 11: {
                    firstLabel.text = qsTr("Without")
                    secondLabel.text = qsTr("a")
                    thirdLabel.text = qsTr("doubt!")
                    break;
                }
                case 12: {
                    firstLabel.text = qsTr("Without")
                    secondLabel.text = qsTr("a")
                    thirdLabel.text = qsTr("doubt!")
                    break;
                }
                case 13: {
                    firstLabel.text = qsTr("Cannot")
                    secondLabel.text = qsTr("predict")
                    thirdLabel.text = qsTr("now.")
                    break;
                }
                case 14: {
                    firstLabel.text = qsTr("Concentrate,")
                    secondLabel.text = qsTr("ask")
                    thirdLabel.text = qsTr("again.")
                    break;
                }
                case 15: {
                    firstLabel.text = ""
                    secondLabel.text = qsTr("Doubtful.")
                    thirdLabel.text = ""
                    break;
                }
                case 16: {
                    firstLabel.text = qsTr("As")
                    secondLabel.text = qsTr(" I see it,")
                    thirdLabel.text = qsTr(" yes.")
                    break;
               }
            }
        }

        function fadeInAnwser() {
            updateAnswerText();
            firstLabelFadeAnim.fromOpacity = 0
            firstLabelFadeAnim.toOpacity = 1
            firstLabelFadeAnim.duration = 300
            secondLabelFadeAnim.fromOpacity = 0
            secondLabelFadeAnim.toOpacity = 1
            secondLabelFadeAnim.duration = 500
            thirdLabelFadeAnim.fromOpacity = 0
            thirdLabelFadeAnim.toOpacity = 1
            thirdLabelFadeAnim.duration = 700
            firstLabelFadeAnim.play()
            secondLabelFadeAnim.play()
            thirdLabelFadeAnim.play()
        }

        function fadeOutAnwser() {
            firstLabelFadeAnim.fromOpacity = 1
            firstLabelFadeAnim.toOpacity = 0
            firstLabelFadeAnim.duration = 700
            secondLabelFadeAnim.fromOpacity = 1
            secondLabelFadeAnim.toOpacity = 0
            secondLabelFadeAnim.duration = 500
            thirdLabelFadeAnim.fromOpacity = 1
            thirdLabelFadeAnim.toOpacity = 0
            thirdLabelFadeAnim.duration = 300
            firstLabelFadeAnim.play()
            secondLabelFadeAnim.play()
            thirdLabelFadeAnim.play()
        }

        Ball {
            id: ball
            onShowText: {
                ballContainer.fadeInAnwser()
            }
            onHideText: {
                ballContainer.fadeOutAnwser()
            }
        }
        Label {
            id: firstLabel
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            touchPropagationMode: TouchPropagationMode.PassThrough
            textStyle {
                textAlign: TextAlign.Center
            }
            preferredWidth: 130
            preferredHeight: 70
            translationY: -70
            opacity: 0
            animations: [
                FadeTransition {
                    id: firstLabelFadeAnim
                    fromOpacity: 0
                    toOpacity: 1
                    duration: 300
                }
            ]
            onOpacityChanged: {
                if (opacity == 0) {
                    ball.isShowingText = false
                    ball.ignoreTaps = false
                    ball.imageSource = ball.thirdAsset
                    ball.startAnimation()
                }
            }
        }
        Label {
            id: secondLabel
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            touchPropagationMode: TouchPropagationMode.PassThrough
            textStyle {
                textAlign: TextAlign.Center
            }
            preferredWidth: 130
            preferredHeight: 70
            opacity: 0
            animations: [
                FadeTransition {
                    id: secondLabelFadeAnim
                    fromOpacity: 0
                    toOpacity: 1
                    duration: 500
                }
            ]
        }
        Label {
            id: thirdLabel
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            touchPropagationMode: TouchPropagationMode.PassThrough
            preferredWidth: 130
            preferredHeight: 70
            textStyle {
                textAlign: TextAlign.Center
            }
            translationY: 70
            opacity: 0
            animations: [
                FadeTransition {
                    id: thirdLabelFadeAnim
                    fromOpacity: 0
                    toOpacity: 1
                    duration: 700
                }
            ]
            onOpacityChanged: {
                if (opacity == 1) {
                    ball.isShowingText = true
                    ball.ignoreTaps = false
                }
            }
        }// Label
        attachedObjects: [
            ImagePaintDefinition {
                id: ballBackground
                imageSource: "asset:///images/ball_background.png"
            }
        ]
    }
}

