import bb.cascades 1.0

ImageView {
    id: ballView

    property bool isShowingText: false
    property bool ignoreTaps: false

    property string firstAsset: "asset:///images/ball1.gif"
    property string secondAsset: "asset:///images/ball2.gif"
    property string thirdAsset: "asset:///images/ball3.gif"

    signal showText()
    signal hideText()
    
    function startAnimation() {
        // start of stupid hack
        var source = imageSource
        imageSource = ""
        imageSource = source
        //end of stupid hack
        ballAnimator.start()
        ignoreTaps = false
    }
    
    function stopAnimation() {
        ballAnimator.stopAt(1,2)
        ignoreTaps = true
    }

    imageSource: firstAsset
    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center
    preferredHeight: 700
    preferredWidth: 700

    attachedObjects: [
        ImageAnimator {
            id: ballAnimator
            property bool isInitialized: false
            animatedImage: ballView.image
            onRunningChanged: {
                console.log("onRunningChanged: " + ballView.imageSource);
                if(!running && isInitialized) {
                    if ( ballView.imageSource == firstAsset ) {
                        ballView.imageSource = secondAsset
                        startAnimation()
                    } else if ( ballView.imageSource == secondAsset ) {
                        ballView.showText()
                        ignoreTaps = true
                        ballView.imageSource = thirdAsset
                    } else if( ballView.imageSource == thirdAsset ) {
                        ballView.imageSource = firstAsset
                        startAnimation()
                    }
                } else if(running && ( ballView.imageSource == secondAsset  || ballView.imageSource == thirdAsset )) {
                    stopAnimation()
                }
            }
        }
    ]
    gestureHandlers: [
        TapHandler {
            onTapped: {
                if(ballView.ignoreTaps) {
                    return;
                }
                if (isShowingText) {
                    ballView.hideText()
                    ignoreTaps = true
                    return;
                }
                console.log("onTapped:" + ballAnimator.running);
                if (ballAnimator.running) {
                    stopAnimation()
                } else {
                    startAnimation()
                }
            }
        }
    ]
    onCreationCompleted: {
        ballAnimator.isInitialized = true
    }
} // ImageView