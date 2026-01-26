cmake_minimum_required(VERSION 3.0)

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
    Filter.cpp
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
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}${STATIC_LIB_SUFFIX})

install(TARGETS ${PROJECT_NAME}
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    COMPONENT library
)

install(FILES ${HEADERS} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/lib${PROJECT_NAME})
