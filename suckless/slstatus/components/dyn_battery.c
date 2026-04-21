/* Written by Lukas Lynch <madi@mxdi.xyz> */
/* Only Linux is supported */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <dirent.h>

#include "../util.h"
#include "../slstatus.h"

#define BAT_PREFIX "BAT"
#define BAT_DIR "/sys/class/power_supply"

static bool err;
static const char *err_str = "err";

/**
* Calculates the number of digits in a given positive integer.
*/
static size_t
count_digits(const unsigned int input) {
    size_t count = 0;
    unsigned int n = input;

    while(n/10 != 0)
        count++;

    return count+1;
}

/**
* Counts number of batteries detected by system.
*
* @return Unsigned integer denoting the number of detected batteries
* @author Lukas Lynch
*/
static unsigned int
count_batteries(void) {
    const size_t bat_prefix_s = strlen(BAT_PREFIX);
    DIR *dir = opendir(BAT_DIR);
    if(!dir) {
        fprintf(stderr, "dyn_battery: Failed to open %s\n", BAT_DIR);
        err = true;
        return 0;
    }

    unsigned int batc = 0;
    struct dirent *entry;
    while((entry = readdir(dir)))
        if(
            strlen(entry->d_name) > bat_prefix_s &&
            strncmp(entry->d_name, BAT_PREFIX, bat_prefix_s) == 0
        ) batc++;

    (void) closedir(dir);
    return batc;
}

/**
* Displays the status and capacity of a dynamic amount of batteries (i.e.
* laptops may have secondary external batteries).
*
* @param  fmt format string to use for each battery display. ordered key:
*             %u: battery number || %s: battery state || %s battery capacity
* @return string containing the status and capacities of all detected batteries
* @author Lukas Lynch
*/
const char *
dyn_battery(const char *fmt) {
    err = false;
    const size_t fmt_s = strlen(fmt);
    const unsigned int batc = count_batteries();

    if(err) // err set by count_batteries()
        return err_str;

    if(batc == 0) 
        return NULL;

    // We need the amount of digits in bat_c for displaying it in strings
    const size_t batc_digits = count_digits(batc);

    char buf[
          (batc * (fmt_s - 2)) // bat count * (format string - "%u" format specifier)
        + (batc * batc_digits) // bat count * digits in bat count
        + 1                    // NULL byte
    ];

    // Fill buffer with 0s, otherwise displacement calculations below can fail
    memset(buf, 0, sizeof(buf));

    /*
    * The displacement variable will be updated with the current string length,
    * which is independent from the buffer size, in order to allow us to write
    * to the buffer without overwriting.
    */
    unsigned int displacement = 0;
    for(unsigned int i=0; i<batc; i++) {
        // Length of BAT_PREFIX + number of digits in bat count + 1 (NULL byte)
        char bat[strlen(BAT_PREFIX) + batc_digits + 1];
        (void) sprintf(bat, "%s%u", BAT_PREFIX, i);

        // Add battery info to output buffer
        displacement += sprintf(
            buf + displacement, // Write into buffer after previous writes
            fmt,                // Format string specified by config.h
            i,
            battery_state(bat), // See components/battery.c
            battery_perc(bat)   // See components/battery.c
        );

        // Add space between battery entries
        buf[displacement++] = ' ';
    }

    // Remove extra space after last battery entry
    buf[--displacement] = '\0';

    return bprintf("%s", buf);
}

#undef BAT_DIR
#undef BAT_PREFIX