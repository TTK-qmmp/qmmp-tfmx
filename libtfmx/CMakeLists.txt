cmake_minimum_required(VERSION 2.8.11)

project(tfmx)

set(HEADERS
    tfmxaudiodecoder.h
)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

set(SOURCES
    CRCLight.cpp
    Decoder.cpp
    DecoderProxy.cpp
    Dump.cpp
    LamePaulaMixer.cpp
    LamePaulaVoice.cpp
    PaulaVoice.cpp
    tfmxaudiodecoder.cpp
    Chris/TFMXDecoder.cpp
    Chris/Macro.cpp
    Chris/Modulation.cpp
    Chris/Pattern.cpp
    Chris/Sequencer.cpp
    Chris/Songs.cpp
    Chris/ByChecksum.cpp
    Chris/SamplesFile.cpp
    Chris/MergedFiles.cpp
    Jochen/HippelDecoder.cpp
    Jochen/Analyze.cpp
    Jochen/COSO.cpp
    Jochen/Envelope.cpp
    Jochen/FC.cpp
    Jochen/Instrument.cpp
    Jochen/MCMD.cpp
    Jochen/ModPack.cpp
    Jochen/Portamento.cpp
    Jochen/Probe.cpp
    Jochen/SMOD.cpp
    Jochen/TFMX7V.cpp
    Jochen/TFMX.cpp
    Jochen/TraitsByChecksum.cpp
    Jochen/Vibrato.cpp
)

add_library(${PROJECT_NAME} STATIC ${SOURCES} ${HEADERS})

install(TARGETS ${PROJECT_NAME}
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT library
)

install(FILES ${HEADERS} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME})
