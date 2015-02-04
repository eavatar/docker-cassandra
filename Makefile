
SUBDIRS = base single cluster tools

.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

base: base/Dockerfile base/Makefile base/overlayfs/Dockerfile
	cd base && make

single: base single/Dockerfile
	cd single && make

cluster: base cluster/Dockerfile
	cd cluster && make

tools: base tools/Dockerfile
	cd tools && make



