# Makefile
MICROBLOG_TEMPLATE := _templates/microblog
POST_DATE := $(shell date +%Y-%m-%d)
POST_TITLE := $(shell uuidgen)
POST_FILE := _microblog/$(POST_DATE)-$(POST_TITLE).md
.PHONY: new-microblog

define POST_LAYOUT
---
layout: post
title: $(POST_TITLE)
---
endef
export POST_LAYOUT

new-microblog:
	echo "$$POST_LAYOUT" > $(POST_FILE) && \
	vim $(POST_FILE)
