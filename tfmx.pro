
QMAKE_CFLAGS += -std=gnu11
greaterThan(QT_MAJOR_VERSION, 5){
    QMAKE_CXXFLAGS += -std=c++17
}else{
    QMAKE_CXXFLAGS += -std=c++11
}

HEADERS += decodertfmxfactory.h \
           decoder_tfmx.h \
           tfmxhelper.h \
           settingsdialog.h

SOURCES += decodertfmxfactory.cpp \
           decoder_tfmx.cpp \
           tfmxhelper.cpp \
           settingsdialog.CPP \
           libtfmx/CRCLight.cpp \
           libtfmx/Decoder.cpp \
           libtfmx/DecoderProxy.cpp \
           libtfmx/Dump.cpp \
           libtfmx/LamePaulaMixer.cpp \
           libtfmx/LamePaulaVoice.cpp \
           libtfmx/PaulaVoice.cpp \
           libtfmx/tfmxaudiodecoder.cpp \
           libtfmx/Chris/TFMXDecoder.cpp \
           libtfmx/Chris/Macro.cpp \
           libtfmx/Chris/Modulation.cpp \
           libtfmx/Chris/Pattern.cpp \
           libtfmx/Chris/Sequencer.cpp \
           libtfmx/Chris/Songs.cpp \
           libtfmx/Chris/ByChecksum.cpp \
           libtfmx/Chris/SamplesFile.cpp \
           libtfmx/Chris/MergedFiles.cpp \
           libtfmx/Jochen/HippelDecoder.cpp \
           libtfmx/Jochen/Analyze.cpp \
           libtfmx/Jochen/COSO.cpp \
           libtfmx/Jochen/Envelope.cpp \
           libtfmx/Jochen/FC.cpp \
           libtfmx/Jochen/Instrument.cpp \
           libtfmx/Jochen/MCMD.cpp \
           libtfmx/Jochen/ModPack.cpp \
           libtfmx/Jochen/Portamento.cpp \
           libtfmx/Jochen/Probe.cpp \
           libtfmx/Jochen/SMOD.cpp \
           libtfmx/Jochen/TFMX7V.cpp \
           libtfmx/Jochen/TFMX.cpp \
           libtfmx/Jochen/TraitsByChecksum.cpp \
           libtfmx/Jochen/Vibrato.cpp

FORMS += settingsdialog.ui

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
    QT += widgets
    CONFIG += warn_off plugin lib thread link_pkgconfig c++11
    TEMPLATE = lib

    unix{
        equals(QT_MAJOR_VERSION, 4){
            QMMP_PKG = qmmp-0
        }else:equals(QT_MAJOR_VERSION, 5){
            QMMP_PKG = qmmp-1
        }else:equals(QT_MAJOR_VERSION, 6){
            QMMP_PKG = qmmp
        }else{
            error("No Qt version found")
        }
        
        PKGCONFIG += $${QMMP_PKG}

        PLUGIN_DIR = $$system(pkg-config $${QMMP_PKG} --variable=plugindir)/Input
        INCLUDEPATH += $$system(pkg-config $${QMMP_PKG} --variable=prefix)/include

        plugin.path = $${PLUGIN_DIR}
        plugin.files = lib$${TARGET}.so
        INSTALLS += plugin
    }
}
