#include "terminal.hpp"

static const size_t VGA_WIDTH = 80;
static const size_t VGA_HEIGHT = 25;
static uint16_t* const VGA_MEMORY = (uint16_t*)0xB8000;
static size_t row = 0;
static size_t column = 0;
static uint8_t color = 0x0F;

static uint16_t vga_entry(char c, uint8_t color) {
    return (uint16_t) c | ((uint16_t) color << 8);
}

void terminalInit() {
    for (size_t y = 0; y < VGA_HEIGHT; y++) {
        for (size_t x = 0; x < VGA_WIDTH; x++) {
            const size_t i = y * VGA_WIDTH + x;
            VGA_MEMORY[i] = vga_entry(' ', color);
        }
    }
}

void terminalWrite(const char* str) {
    while (*str) {
        const size_t i = row * VGA_WIDTH + column;
        VGA_MEMORY[i] = vga_entry(*str++, color);
        if (++column >= VGA_WIDTH) {
            column = 0;
            if (++row >= VGA_HEIGHT) row = 0;
        }
    }
}

