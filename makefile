

UNIT_DEST=/usr/lib/systemd/system
BIN_DEST=/usr/bin

daemon: clean installd-dev

installd-dev:
	sudo cp daemon/blockpyd ${BIN_DEST}
	sudo cp daemon/blockpyd.service ${UNIT_DEST}
	sudo cp daemon/blockpyd.timer ${UNIT_DEST}
	sudo systemctl start blockpyd.timer
	sudo systemctl enable blockpyd.service


clean:
	sudo systemctl stop blockpyd.timer || echo -n
	sudo rm ${UNIT_DEST}/blockpyd.service || echo -n
	sudo rm ${UNIT_DEST}/blockpyd.timer || echo -n
	sudo rm ${BIN_DEST}/blockpyd || echo -n
