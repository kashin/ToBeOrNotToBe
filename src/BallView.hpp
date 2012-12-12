/*
 * BallView.h
 *
 *  Created on: 05.12.2012
 *      Author: golovinskaya.a
 */

#ifndef BALLVIEW_H_
#define BALLVIEW_H_

#include <bb/cascades/CustomControl>
#include <bb/cascades/Container>
#include <bb/cascades/TouchEvent>
#include <bb/cascades/ImageView>
#include <bb/cascades/Image>
#include <bb/cascades/ImplicitAnimationController>
#include <bb/cascades/Label>

#include <QObject>
#include <vector>

using namespace std;
using namespace bb::cascades;

class BallView: public CustomControl {

    Q_OBJECT
    Q_PROPERTY(float value READ value WRITE setValue
            NOTIFY valueChanged FINAL)
    Q_PROPERTY(float centerX READ centerX WRITE setCenterX
    		NOTIFY centerXChanged)
    Q_PROPERTY(float centerY READ centerY WRITE setCenterY
        		NOTIFY centerYChanged)
public:
    BallView();
    virtual ~BallView();

    float value() const;
    void setValue(float value);

    void innerCircle(QVariant innerCircle);

    float centerX();
    void setCenterX(float i);

    float centerY();
    void setCenterY(float i);

Q_SIGNALS:
    void valueChanged(float value);
    void centerXChanged(float centerX);
    void centerYChanged(float centerY);

private slots:
    void onSliderHandleTouched(bb::cascades::TouchEvent *pTouchEvent);

private slots:
    void onWidthChanged(float width);
    void onHeightChanged(float height);

private:
    void onSizeChanged();
    void onCenterChanged();
    void processRawCoordinates(float inX, float inY);

    Container *mRootContainer;
    ImageView *mTrackImage;

    float mWidth;
    float mHeight;
    float mrevAngle;

    float mCenterX;
    float mCenterY;
    float mRelativeCenterX;
    float mRelativeCenterY;
    float mRadiusCircle;

    Image mHandleOn;
    Image mHandleOff;
    ImageView *mHandle;
    Container *mHandleContainer;

    Image mBallCenter;
    ImageView *mBallCenterView;
    Container *mBallCenterContainer;

    vector<pair<int, int> > pointsOnCircumference;
    float mAngle;
    float mValue;
    ImplicitAnimationController mHandleImplicitAnimationController;
};

#endif /* BALLVIEW_H_ */
