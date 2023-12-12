QMAKE_CXXFLAGS += -std=c++11
QMAKE_CFLAGS += -std=gnu11

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

#CONFIG += BUILD_PLUGIN_INSIDE
contains(CONFIG, BUILD_PLUGIN_INSIDE){
    include($$PWD/../../plugins.pri)
    TARGET = $$PLUGINS_PREFIX/Input/tfmx

    unix{
        target.path = $$PLUGIN_DIR/Input
        INSTALLS += target
    }

    win32{
        LIBS += -lws2_32
    }
}else{
    CONFIG += warn_off plugin lib thread link_pkgconfig c++11
    TEMPLATE = lib

    unix{
        PKGCONFIG += qmmp-1

        PLUGIN_DIR = $$system(pkg-config qmmp-1 --variable=plugindir)/Input
        INCLUDEPATH += $$system(pkg-config qmmp-1 --variable=prefix)/include

        plugin.path = $${PLUGIN_DIR}
        plugin.files = lib$${TARGET}.so
        INSTALLS += plugin
    }
}
