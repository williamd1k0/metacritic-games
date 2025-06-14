year := 2025

charts:
	@uv run plotscores.py

xbox:
	@echo "Fetching Xbox Data"
	@fish ./fetch-all.fish xbox 2002 2018
x360:
	@echo "Fetching Xbox 360 Data"
	@fish ./fetch-all.fish xbox-360 2005 2019
xone:
	@echo "Fetching Xbox One Data"
	@fish ./fetch-all.fish xbox-one 2013 ${year}
xbox_sxs:
	@echo "Fetching Xbox Series X|S Data"
	@fish ./fetch-all.fish xbox-series-x 2020 ${year}

ps1:
	@echo "Fetching PlayStation 1 Data"
	@fish ./fetch-all.fish ps1 1994 2016
ps2:
	@echo "Fetching PlayStation 2 Data"
	@fish ./fetch-all.fish ps2 2000 2013
ps3:
	@echo "Fetching PlayStation 3 Data"
	@fish ./fetch-all.fish ps3 2006 2020
ps4:
	@echo "Fetching PlayStation 4 Data"
	@fish ./fetch-all.fish ps4 2013 ${year}
ps5:
	@echo "Fetching PlayStation 5 Data"
	@fish ./fetch-all.fish ps5 2020 ${year}
psp:
	@echo "Fetching PlayStation Portable Data"
	@fish ./fetch-all.fish psp 2004 2017
psvita:
	@echo "Fetching PlayStation Vita Data"
	@fish ./fetch-all.fish ps-vita 2011 2023

n64:
	@echo "Fetching Nintendo 64 Data"
	@fish ./fetch-all.fish nintendo-64 1996 2007
gamecube:
	@echo "Fetching GameCube Data"
	@fish ./fetch-all.fish gamecube 2001 2007
wii:
	@echo "Fetching Wii Data"
	@fish ./fetch-all.fish wii 2006 2020
wiiu:
	@echo "Fetching Wii U Data"
	@fish ./fetch-all.fish wii-u 2012 2017
switch:
	@echo "Fetching Nintendo Switch Data"
	@fish ./fetch-all.fish nintendo-switch 2017 ${year}
switch2:
	@echo "Fetching Nintendo Switch 2 Data"
	@fish ./fetch-all.fish nintendo-switch-2 2025 ${year}
ds:
	@echo "Fetching Nintendo DS Data"
	@fish ./fetch-all.fish nintendo-ds 2004 2016
3ds:
	@echo "Fetching Nintendo 3DS Data"
	@fish ./fetch-all.fish 3ds 2011 2023
gba:
	@echo "Fetching Nintendo GBA Data"
	@fish ./fetch-all.fish game-boy-advance 2001 2025

dc:
	@echo "Fetching Dreamcast Data"
	@fish ./fetch-all.fish dreamcast 1998 2024

.PHONY: charts xbox x360 xone xbox_sxs ps1 ps2 ps3 ps4 ps5 psp psvita n64 gamecube wii wiiu switch switch2 ds 3ds gba dc
