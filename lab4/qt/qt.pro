######################################################################
# Automatically generated by qmake (3.1) Mon Apr 12 10:05:18 2021
######################################################################

TEMPLATE = app
TARGET = qt
INCLUDEPATH += .
QT += widgets gui core

QMAKE_CXXFLAGS += -O0 -g -ggdb

# You can make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# Please consult the documentation of the deprecated API in order to know
# how to port your code away from it.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Input
HEADERS += mainwindow.h tree_widget.h enter_data.h
SOURCES += main.cpp mainwindow.cpp tree_widget.cpp enter_data.cpp

FORMS += \
    mainwindow.ui
