

UNIT_DEST=/usr/lib/systemd/system
BIN_DEST=/usr/bin

dev: dev-clean install-unit start-unit

install : install-unit install-scripts enable-unit

install-scripts:
	install daemon/blockpyd ${BIN_DEST}
	install cli/blockpy ${BIN_DEST}

install-unit:
	install daemon/blockpyd.service ${UNIT_DEST}
	install daemon/blockpyd.timer ${UNIT_DEST}

start-unit:
	systemctl start blockpyd.timer

enable-unit: install-unit
	systemctl enable --now blockpyd.timer

remove:
	systemctl stop blockpyd.timer
	systemctl disable blockpyd.timer
	rm ${UNIT_DEST}/blockpyd.*
	rm ${BIN_DEST}/blockpyd
	rm ${BIN_DEST}/blockpy

dev-clean:
	systemctl stop blockpyd.timer || echo -n
	rm ${UNIT_DEST}/blockpyd.service || echo -n
	rm ${UNIT_DEST}/blockpyd.timer || echo -n
