VERSION=0.1.0

BUILD_DIR=.build
DEBPKG_NAME=proxyd-debian-$(VERSION)
DEBBUILD_DIR=$(BUILD_DIR)/$(DEBPKG_NAME)

clean:
	rm -rf $(BUILD_DIR) || true

install:
	cp -r ./etc /
	cp -r ./usr /
	chmod +x /usr/local/bin/avahi-alias.sh

deb-pkg:
	mkdir -p $(DEBBUILD_DIR)
	cp -r ./DEBIAN $(DEBBUILD_DIR)
	cp -r ./etc $(DEBBUILD_DIR)
	cp -r ./usr $(DEBBUILD_DIR)
	echo "Version: $(VERSION)" >> $(DEBBUILD_DIR)/DEBIAN/control
	chmod +x $(DEBBUILD_DIR)/usr/local/bin/avahi-alias.sh
	dpkg-deb -v --build --root-owner-group $(DEBBUILD_DIR)
