include($$PWD/../../plugins.pri)

QMAKE_CXXFLAGS += -std=c++11
QMAKE_CFLAGS += -std=gnu11

TARGET = $$PLUGINS_PREFIX/Input/tfmx

HEADERS += decodertfmxfactory.h \
           decoder_tfmx.h \
           tfmxhelper.h
    
SOURCES += decodertfmxfactory.cpp \
           decoder_tfmx.cpp \
           tfmxhelper.cpp \
           libtfmx/tfmx_audio.c \
           libtfmx/tfmx_iface.c \
           libtfmx/tfmx_loader.c \
           libtfmx/tfmx_player.c \
           libtfmx/tfmx_state.c \
           libtfmx/unsqsh.c

INCLUDEPATH += $$PWD/libtfmx

unix {
    target.path = $$PLUGIN_DIR/Input
    INSTALLS += target
}

win32 {
    LIBS += -lws2_32
}
