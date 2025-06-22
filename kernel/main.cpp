#include "terminal.hpp"

extern "C" void kernelMain() {
    terminalInit();
    terminalWrite("Hello, kernel World!\n");
}

