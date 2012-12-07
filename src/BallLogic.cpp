/*
 * BallLogic.cpp
 *
 *  Created on: 08.11.2012
 *      Author: golovinskaya.a
 */

#include "BallLogic.hpp"

BallLogic::BallLogic(QObject* parent)
: QObject(parent)
{
}

BallLogic::~BallLogic()
{

}

int BallLogic::value()
{
	return _value;
}
void BallLogic::setValue(int i)
{
	_value = i;
	emit valueChanged(_value);
}

int BallLogic::preferredHeight()
{
	return _preferredHeight;
}
void BallLogic::setPreferredHeight(int i)
{
	_preferredHeight = i;
	emit preferredHeightChanged(_preferredHeight);
}

int BallLogic::preferredWidth()
{
	return _preferredWidth;
}
void BallLogic::setPreferredWidth(int i)
{
	_preferredWidth = i;
	emit preferredWidthChanged(_preferredWidth);
}

int BallLogic::centerX()
{
	return _centerX;
}
void BallLogic::setCenterX(int i)
{
	_centerX = i;
	emit centerXChanged(_centerX);
}

int BallLogic::centerY()
{
	return _centerY;
}
void BallLogic::setCenterY(int i)
{
	_centerY = i;
	emit centerYChanged(_centerY);
}
