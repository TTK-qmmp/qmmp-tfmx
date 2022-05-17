/* Miscellaneous functions for using & implementing the general
 * interface to TFMXPlay
 */

#ifndef TFMXIFACE_H
#define TFMXIFACE_H

struct TfmxData;

/* Error function definition */
#define TFMXERR(state, x) TFMXError(state, x)
void TFMXError(TfmxState* state, char *err);

/* TFMX file & playing management */
int LoadTFMXFile(TfmxState* state, struct TfmxData* mdat, struct TfmxData* samp);
void TFMXRewind(TfmxState* state);
void TFMXStop(TfmxState* state);
void TFMXQuit(TfmxState* state);

/* Per-module info */
void TFMXFillModuleInfo(TfmxState* state, char* buffer);
void TFMXFillTextInfo(TfmxState* state, char* buffer);
int TFMXGetSubSongs(TfmxState* state);

/* TFMX player settings read/write */
int TFMXGetSubSong(TfmxState* state);
void TFMXSetSubSong(TfmxState* state, int num);

/* Sample buffer handling */
long TFMXGetBlockSize(TfmxState* state);
int TFMXGetBlock(TfmxState* state, void* buffer);
int TFMXTryToMakeBlock(TfmxState* state);

#endif
