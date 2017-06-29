# location of the Python header files
# OpenCV library status:
# --     version: 3.2.0
# --     libraries: opencv_calib3d;opencv_core;opencv_features2d;opencv_flann;opencv_highgui;opencv_imgcodecs;opencv_imgproc;opencv_ml;opencv_objdetect;opencv_photo;opencv_shape;opencv_stitching;opencv_superres;opencv_video;opencv_videoio;opencv_videostab
# --     include path: /usr/local/include;/usr/local/include/opencv
 
PYTHON_VERSION = 2.7
PYTHON_INCLUDE = /usr/include/python
 
# location of the Boost Python include files and library
 
BOOST_INC = /usr/include
BOOST_LIB = /usr/lib
 
# compile mesh classes
TARGET = screencapture
 
$(TARGET).so: $(TARGET).o
	g++ -fPIC -std=c++11 -shared -Wl,--export-dynamic $(TARGET).o -L$(BOOST_LIB) -lX11 -lboost_python -L/usr/lib/python$(PYTHON_VERSION)/config -lpython$(PYTHON_VERSION) -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_ml -lopencv_video -lopencv_features2d -lX11 -lopencv_calib3d -lopencv_objdetect -lopencv_flann -I /lib/ -o $(TARGET).so
 
$(TARGET).o: $(TARGET).cpp
	g++ -fPIC -std=c++11 -I$(PYTHON_INCLUDE) -I/usr/include/python2.7 -I$(BOOST_INC) -I/usr/local/include -I/usr/local/include/opencv -I /lib/ -c $(TARGET).cpp

# $(TARGET).out: $(TARGET).cpp
# 	g++ -std=c++11 -I/usr/include/opencv $(TARGET).cpp -o $(TARGET) -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_ml -lopencv_video -lopencv_features2d -lX11 -lopencv_calib3d -lopencv_objdetect -lopencv_flann -I /lib/