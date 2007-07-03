/* vi: set sw=4 ts=4: */
/* common.c
 *
 * Functions for debugging and logging as well as some other
 * simple helper functions.
 *
 * Russ Dill <Russ.Dill@asu.edu> 2001-2003
 * Rewritten by Vladimir Oleynik <dzo@simtreas.ru> (C) 2003
 *
 * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
 */

#include "common.h"

const uint8_t MAC_BCAST_ADDR[6] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };

void udhcp_make_pidfile(const char *pidfile)
{
	/* Make sure fd 0,1,2 are open */
	bb_sanitize_stdio();

	/* Equivalent of doing a fflush after every \n */
	setlinebuf(stdout);

	/* Create pidfile */
	if (pidfile && !write_pidfile(pidfile))
		bb_perror_msg("cannot create pidfile %s", pidfile);

	bb_info_msg("%s (v%s) started", applet_name, BB_VER);
}
