#
# Copyright (C) 2018-2019 QuasarApp.
# Distributed under the lgplv3 software license, see the accompanying
# Everyone is permitted to copy and distribute verbatim copies
# of this license document, but changing it is not allowed.
#

QT       -= core gui
CONFIG += c++17

TARGET = pe-parser-library
TEMPLATE = lib

DEFINES += PEPARSER_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG(release, debug|release): {
    DESTDIR="$$PWD/build/release"
} else {
    DESTDIR="$$PWD/build/debug"
}

INCLUDEPATH += "$$PWD/include"


HEADERS += \
    include/pe-parse/nt-headers.h \
    include/pe-parse/parse.h \
    include/pe-parse/to_string.h

SOURCES += \
    src/buffer.cpp \
    src/parse.cpp

win32-msvc: {
    SOURCES += src/unicode_winapi.cpp
} else : {
    SOURCES += src/unicode_codecvt.cpp
}
