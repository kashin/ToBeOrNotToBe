/*
 * BallLogic.cpp
 *
 *  Created on: 08.11.2012
 *      Author: golovinskaya.a
 */

#include "BallLogic.hpp"

/*BallLogic::BallLogic() {
	// TODO Auto-generated constructor stub

}*/

/*BallLogic::~BallLogic() {
	// TODO Auto-generated destructor stub
}*/

    int BallLogic::value()
    {
        return miValue;
    }

    void BallLogic::setValue(int i)
    {
    	miValue = i;
        emit valueChanged(miValue);
    }


