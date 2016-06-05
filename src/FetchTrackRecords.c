/*
	This is a port of the Windows game Need For Speed™ II Special Edition.
	Copyright (C) 2014-2016  Błażej Szczygieł

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "Wrapper.h"

#include <string.h>

REGPARM void sub_41B250(uint32_t arg1, void *arg2);

typedef struct
{
	char name[10];
	int16_t car;
	int32_t time;
	int32_t mode;
} __attribute__((packed)) StfEntry;
typedef struct
{
	StfEntry bestLap;
	StfEntry laps[3][10];
} Stf;

REALIGN REGPARM FILE *fopen_wrap(const char *fileName, const char *p)
{
	char *tmpFileName = convertFilePath(fileName, true);
	FILE *f = fopen(tmpFileName, p);
	free(tmpFileName);
	return f;
}

static void readEntry(FILE *f, StfEntry *stfEntry)
{
	uint32_t i;
	fgets(stfEntry->name, sizeof stfEntry->name, f);
	for (i = 0; i < sizeof stfEntry->name; ++i)
		if (stfEntry->name[i] == '\t' || stfEntry->name[i] == '\n' || stfEntry->name[i] == '\r')
			stfEntry->name[i] = '\0';
	fscanf(f, "%hi\n%d\n%d\n", &stfEntry->car, &stfEntry->time, &stfEntry->mode);
}

REALIGN REGPARM void fetchTrackRecords(uint32_t trackNo, BOOL clear)
{
	char buffer[MAX_PATH];
	Stf stf;
	FILE *f;

	memset(&stf, 0, sizeof stf);

	if (!clear)
	{
		//Get the track records relative file path, +20 means that we want a text file (ssf), not a binary file (stf)
		sub_41B250(trackNo + 20, buffer);
		if ((f = fopen_wrap(buffer, "r")))
		{
			//Skip unneeded data
			fgets(buffer, 80, f);
			fscanf(f, "%d\n", (int32_t *)buffer);
			fgets(buffer, 80, f);

			uint32_t i, j;
			readEntry(f, &stf.bestLap); //Best lap
			for (j = 0; j < 3; ++j)
			{
				fgets(buffer, 80, f); //Skip unneeded line
				for (i = 0; i < 10; ++i)
					readEntry(f, &stf.laps[j][i]);
			}

			fclose(f);
		}
	}

	//Get the track records relative file path, get a binary file (stf)
	sub_41B250(trackNo, buffer);
	if ((f = fopen_wrap(buffer, "wb")))
	{
		fwrite(&stf, 1, sizeof stf, f);
		fclose(f);
	}
}
