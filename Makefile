# location of the Python header files
 
PYTHON_VERSION = 2.7
PYTHON_INCLUDE = /usr/include/python
 
# location of the Boost Python include files and library
 
BOOST_INC = /usr/include
BOOST_LIB = /usr/lib
 
# compile mesh classes
TARGET = screencapture
 
$(TARGET).so: $(TARGET).o
	g++ -fPIC -std=c++11 -shared -Wl,--export-dynamic $(TARGET).o -L$(BOOST_LIB) -L${OpenCV_LIBS} -lX11 -lboost_python -L/usr/lib/python$(PYTHON_VERSION)/config -lpython$(PYTHON_VERSION) -o $(TARGET).so
 
$(TARGET).o: $(TARGET).cpp
	g++ -fPIC -std=c++11 -I$(PYTHON_INCLUDE) -I/usr/include/python2.7 -I$(BOOST_INC) -I/usr/local/include -I/usr/local/include/opencv -c $(TARGET).cpp