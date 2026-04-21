/* See LICENSE file for copyright and license details. */

/* interval between updates (in ms) */
const unsigned int interval = 1000;

/* text to show if no value can be retrieved */
static const char unknown_str[] = "n/a";

/* maximum output string length */
#define MAXLEN 2048

/*
 * NOTE:
 * slstatus cannot truly center time in the middle of screen.
 * For exact centered clock in dwm,
 * use a centered-status patch for dwm.
 */

static const struct arg args[] = {
	{ datetime,      "%s                                                                             ",               "%a %d %b  %I:%M %p" },
	{ cpu_perc,      " 󰍛  %s%% | ",              NULL },
	{ ram_perc,      "   %s%% | ",              NULL },
	{ run_command,   " 󰃠  %s%% | ",              "brightnessctl -m | cut -d, -f4 | tr -d '%'" },
	{ run_command,   " 󰕾  %s%% |",               "amixer get Master | awk -F'[][]' 'END{print $2}' | tr -d '%'" },
	{ battery_perc,  " 󰁹  %s%%  ",              "BAT0" },
};
