#include <stdio.h>

#include "tfmx.h"
#include "tfmx_iface.h"

void TFMXError(TfmxState* state, char* err) {
    printf("TFMXError %s\n", err);
}
