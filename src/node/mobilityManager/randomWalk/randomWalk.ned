//****************************************************************************
//*  Copyright: National ICT Australia,  2007 - 2010                         *
//*  Developed at the ATP lab, Networked Systems research theme              *
//*  Author(s): Yuriy Tselishchev                                            *
//*  This file is distributed under the terms in the attached LICENSE file.  *
//*  If you do not find this file, copies can be found by writing to:        *
//*                                                                          *
//*      NICTA, Locked Bag 9013, Alexandria, NSW 1435, Australia             *
//*      Attention:  License Inquiry.                                        *
//*                                                                          *  
//****************************************************************************/

package node.mobilityManager.randomWalk;

simple RandomWalk like node.mobilityManager.iMobilityManager {
 parameters:
	bool collectTraceInfo = default (false);
	double updateInterval = default (1000);

	double xCoorDestination = default (0);
	double yCoorDestination = default (0);
	double zCoorDestination = default (0);

	double speed = default (1);
	double timeToBack = default(0);

	double xLength = default(0);
	double yLength = default(0);

	double simuTime = default(0);
	bool hold = default(false);
}
