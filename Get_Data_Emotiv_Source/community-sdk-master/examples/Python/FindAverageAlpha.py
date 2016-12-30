import sys
import os
import platform
import time
import ctypes

from array import *
from ctypes import *
from __builtin__ import exit
from apscheduler.schedulers.background import BackgroundScheduler
sched = BackgroundScheduler()

def AvgCal():
    global LeftAlphaAvg
    global RightAlphaAvg
    global count
    LeftAlphaAvg=LeftAlphaAvg/count
    RightAlphaAvg=RightAlphaAvg/count
    print "Left Alpha Average = %0.6f Right Alpha Average = %0.6f" %(LeftAlphaAvg,RightAlphaAvg)
    count=0
    exit();

try:
    if sys.platform.startswith('win32'):
        libEDK = cdll.LoadLibrary("../../bin/win32/edk.dll")
    elif sys.platform.startswith('linux'):
        srcDir = os.getcwd()
	if platform.machine().startswith('arm'):
            libPath = srcDir + "/../../bin/armhf/libedk.so"
	else:
            libPath = srcDir + "/../../bin/linux64/libedk.so"
        libEDK = CDLL(libPath)
    else:
        raise Exception('System not supported.')
except Exception as e:
    print 'Error: cannot load EDK lib:', e
    exit()

IEE_EmoEngineEventCreate = libEDK.IEE_EmoEngineEventCreate
IEE_EmoEngineEventCreate.restype = c_void_p
eEvent = IEE_EmoEngineEventCreate()

IEE_EmoEngineEventGetEmoState = libEDK.IEE_EmoEngineEventGetEmoState
IEE_EmoEngineEventGetEmoState.argtypes = [c_void_p, c_void_p]
IEE_EmoEngineEventGetEmoState.restype = c_int

IEE_EmoStateCreate = libEDK.IEE_EmoStateCreate
IEE_EmoStateCreate.restype = c_void_p
eState = IEE_EmoStateCreate()

userID = c_uint(0)
user   = pointer(userID)
ready  = 0
state  = c_int(0)

alphaValue     = c_double(0)
low_betaValue  = c_double(0)
high_betaValue = c_double(0)
gammaValue     = c_double(0)
thetaValue     = c_double(0)

alpha     = pointer(alphaValue)
low_beta  = pointer(low_betaValue)
high_beta = pointer(high_betaValue)
gamma     = pointer(gammaValue)
theta     = pointer(thetaValue)

channelList = array('I',[5, 14])   # IED_AF3, IED_AF4, IED_T7, IED_T8, IED_Pz

if libEDK.IEE_EngineConnect("Emotiv Systems-5") != 0:
        print "Emotiv Engine start up failed."
        exit();

alphaArr=[-1]*2
LeftAlphaAvg=0
RightAlphaAvg=0
count=0
#sched.add_job(AvgCal, 'interval',id="avgcalclator", seconds=5)
#schedule=True
while (1):
    state = libEDK.IEE_EngineGetNextEvent(eEvent)

    if state == 0:
        eventType = libEDK.IEE_EmoEngineEventGetType(eEvent)
        libEDK.IEE_EmoEngineEventGetUserId(eEvent, user)
        if eventType == 16:  # libEDK.IEE_Event_enum.IEE_UserAdded
            ready = 1
            libEDK.IEE_FFTSetWindowingType(userID, 1);  # 1: libEDK.IEE_WindowingTypes_enum.IEE_HAMMING
            print "User added"

        if ready == 1:
            j=-1
            for i in channelList:
                result = c_int(0)
                result = libEDK.IEE_GetAverageBandPowers(userID, i, theta, alpha, low_beta, high_beta, gamma)

                if result == 0:    #EDK_OK
                    j=j+1
                    print "%.6f, %.6f, %.6f, %.6f, %.6f %d\n" % (thetaValue.value, alphaValue.value,
                                                               low_betaValue.value, high_betaValue.value, gammaValue.value,i)
                    alphaArr[j]=alphaValue.value
            if(alphaArr[0]!=-1):
                LeftAlphaAvg=LeftAlphaAvg+alphaArr[0]
                RightAlphaAvg=RightAlphaAvg+alphaArr[1]
                count=count+1
            if(count==70):
                AvgCal()
            alphaArr=[-1,-1]
    elif state != 0x0600:
        print "Internal error in Emotiv Engine ! "
    time.sleep(0.1)
# -------------------------------------------------------------------------
libEDK.IEE_EngineDisconnect()
libEDK.IEE_EmoStateFree(eState)
libEDK.IEE_EmoEngineEventFree(eEvent)