#pragma once

struct TfmxState;

#ifdef __cplusplus__
extern "C" {
#endif

    void tfmx_calc_sizes(struct TfmxState* state);
    long TFMXGetBlockSize(struct TfmxState* state);
    int  TFMXGetBlock(struct TfmxState* state, void *buffer);
    int  TFMXTryToMakeBlock(struct TfmxState* state);
    void TfmxTakedown(struct TfmxState* state);
    void TfmxResetBuffers(struct TfmxState* state);

#ifdef __cplusplus__
}
#endif

