# Makefile
MICROBLOG_TEMPLATE := _templates/microblog
POST_DATE := $(shell date +%Y-%m-%d)
POST_TITLE := $(shell uuidgen)
POST_TIME := $(shell date +%Y-%m-%d\ %T\ %z)
POST_FILE := _microblog/$(POST_DATE)-$(POST_TITLE).md
.PHONY: new-microblog

define POST_LAYOUT
---
date: $(POST_TIME)
title: $(POST_TITLE)
layout: post
---
endef
export POST_LAYOUT

new-microblog:
	echo "$$POST_LAYOUT" > $(POST_FILE) && \
	vim $(POST_FILE)
