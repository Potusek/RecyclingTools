# Pobierz dane z modinfo.json
MOD_NAME = $(shell grep -o '"modid": *"[^"]*"' modinfo.json | cut -d'"' -f4)
VERSION = $(shell grep -o '"version": *"[^"]*"' modinfo.json | cut -d'"' -f4)
DISPLAY_NAME = $(shell grep -o '"name": *"[^"]*"' modinfo.json | cut -d'"' -f4)
OUTPUT_FILE = $(MOD_NAME)-v$(VERSION).zip

.PHONY: all clean pack

all: pack

pack:
	@echo "Znaleziono mod: $(DISPLAY_NAME) [$(MOD_NAME)] v$(VERSION)"
	@echo "Pakowanie moda..."
	@rm -f $(OUTPUT_FILE)
	@zip -r $(OUTPUT_FILE) modinfo.json modicon.png assets/
	@echo "Mod został spakowany do pliku: $(OUTPUT_FILE)"

clean:
	@rm -f $(OUTPUT_FILE)
	@echo "Usunięto plik: $(OUTPUT_FILE)"