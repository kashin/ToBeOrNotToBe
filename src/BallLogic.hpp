/*
 * BallLogic.h
 *
 *  Created on: 08.11.2012
 *      Author: golovinskaya.a
 */

#ifndef BALLLOGIC_H_
#define BALLLOGIC_H_

#include <QObject>
#include <QString>

class BallLogic : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)
    Q_PROPERTY(int preferredHeight READ preferredHeight WRITE setPreferredHeight NOTIFY preferredHeightChanged)
    Q_PROPERTY(int preferredWidth READ preferredWidth WRITE setPreferredWidth NOTIFY preferredWidthChanged)
    Q_PROPERTY(int centerX READ centerX WRITE setCenterX NOTIFY centerXChanged)
    Q_PROPERTY(int centerY READ centerY WRITE setCenterY NOTIFY centerYChanged)


public:
    explicit BallLogic(QObject* parent = 0);
    virtual ~BallLogic();

    Q_INVOKABLE int value();
    Q_INVOKABLE void setValue(int i);

    Q_INVOKABLE int preferredHeight();
    Q_INVOKABLE void setPreferredHeight(int i);

    Q_INVOKABLE int preferredWidth();
    Q_INVOKABLE void setPreferredWidth(int i);

    Q_INVOKABLE int centerX();
    Q_INVOKABLE void setCenterX(int i);

    Q_INVOKABLE int centerY();
    Q_INVOKABLE void setCenterY(int i);

signals:
    void valueChanged(int);
    void preferredHeightChanged(int);
    void preferredWidthChanged(int);
    void centerXChanged(int);
    void centerYChanged(int);

private:
	int _value;
	int _preferredHeight;
	int _preferredWidth;
	int _centerX;
	int _centerY;
};

#endif /* BALLLOGIC_H_ */
