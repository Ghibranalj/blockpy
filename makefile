

UNIT_DEST=/usr/lib/systemd/system
BIN_DEST=/usr/bin

dev: dev-clean install-unit start-unit

install : install-unit install-scripts enable-unit

install-scripts:
	sudo cp daemon/blockpyd ${BIN_DEST}
	sudo cp cli/blockpy ${BIN_DEST}

install-unit:
	sudo cp daemon/blockpyd.service ${UNIT_DEST}
	sudo cp daemon/blockpyd.timer ${UNIT_DEST}

start-unit:
	systemctl start blockpyd.timer

enable-unit: install-unit
	systemctl enable --now blockpyd.timer

remove:
	sudo systemctl stop blockpyd.timer
	sudo systemctl disable blockpyd.timer
	sudo rm ${UNIT_DEST}/blockpyd.*
	sudo rm ${BIN_DEST}/blockpyd
	sudo rm ${BIN_DEST}/blockpy

dev-clean:
	sudo systemctl stop blockpyd.timer || echo -n
	sudo rm ${UNIT_DEST}/blockpyd.service || echo -n
	sudo rm ${UNIT_DEST}/blockpyd.timer || echo -n
