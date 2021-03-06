import bb.cascades 1.0

ScrollView {
    id: scrollView
    scrollViewProperties {
        scrollMode: ScrollMode.Both
        pinchToZoomEnabled: true
    }
    layoutProperties: StackLayoutProperties { spaceQuota: 1.0 }
    
    Container {
        background: Color.LightGray
        
        WebView {
            id: webView
            url: "local:///assets/About.htm"
            settings {
                javaScriptEnabled: false
            }
            
            onMinContentScaleChanged: {
                scrollView.scrollViewProperties.minContentScale = minContentScale;
            }
            
            onMaxContentScaleChanged: {
                scrollView.scrollViewProperties.maxContentScale = maxContentScale;
            }
            onUrlChanged: {
                url = "local:///assets/About.htm"
            }
        }
    }
}