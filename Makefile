MARKDOWN = md4c/build/md2html/md2html

# Copies files from src/ to dst/. Any .html files are
# interpreted by GNU m4 and wrapped in a the GNU m4
# template. Common m4 macros may be stored in a macros
# file.

MACROS    := macros.m4
SRC	  := src
DST       := dst
TEMPLATES := templates
BLOG      := news
PAGES     := $(SRC)/pages
POSTS     := $(SRC)/$(BLOG)
MAIN_T    := $(TEMPLATES)/main.html.m4
BLOG_T    := $(TEMPLATES)/blog.html.m4
POST_T	  := $(TEMPLATES)/post.html.m4
PAGE_T    := $(TEMPLATES)/page.html.m4
ATOM_T    := $(TEMPLATES)/atom.xml.m4
ATOM_E_T  := $(TEMPLATES)/atom_entry.xml.m4

# Build a list of all the files that should exist when the
# baking is done. We do this by getting a list of all the
# source files and rewriting pathnames and file suffixes as
# necessary.
raw_posts  := $(shell find $(POSTS) -name index.html* -prune -o -type f)
raw_posts  := $(raw_posts:$(POSTS)/%=$(DST)/$(BLOG)/%)
raw_posts  := $(raw_posts:.m4=)
raw_posts  := $(filter-out %.inc %.swp %~ \#%,$(raw_posts))
raw_posts  := $(raw_posts:.md=.html)

raw_pages  := $(shell find $(SRC) -type d -name $(BLOG) -prune -o -type f)
raw_pages  := $(raw_pages:$(SRC)/%=$(DST)/%)
raw_pages  := $(raw_pages:.m4=)
raw_pages  := $(filter-out %.inc %.swp %~ \#%,$(raw_pages))
raw_pages  := $(raw_pages:.md=.html)

sp :=
sp += # add space
post-sort = $(shell echo -e $(subst $(sp),'\n',$2) | sort $1 --key=1,1 -)
sorted_posts := $(addprefix $(POSTS)/,$(call post-sort,-r,$(notdir $(wildcard $(POSTS)/*.md.m4))))

all: clean-index clean-atom index atom posts pages

posts: $(raw_posts)

pages: $(raw_pages)

$(POSTS)/%.html: $(POSTS)/%.html.m4 $(MACROS) $(MAIN_T) $(POST_T)
	m4 -P $(MACROS) $< $(POST_T) $(MAIN_T) > $@

$(SRC)/%.html: $(SRC)/%.html.m4 $(MACROS) $(MAIN_T) $(PAGE_T)
	m4 -P $(MACROS) $< $(PAGE_T) $(MAIN_T) > $@

index:
	echo "TITLE({\"News\"})" >> $(POSTS)/index.html.m4
	echo "BODY({\"{\"" >> $(POSTS)/index.html.m4
	for f in $(sorted_posts); do \
		link="`basename $$f .md.m4`.html";\
		head -n3 $$f | m4 -D "__URL"=$$link  \
			-P $(MACROS) - $(BLOG_T) >> $(POSTS)/index.html.m4; \
	done
	echo "\"}\"})" >> $(POSTS)/index.html.m4

atom: $(MARKDOWN)
	m4 -P $(MACROS) $(ATOM_T) > $(SRC)/atom.xml
	for f in $(sorted_posts); do \
		link="`basename $$f .md.m4`.html";\
		$(MARKDOWN) $$f | m4 -D "__URL"=$$link -P $(MACROS) - $(ATOM_E_T) \
			| tail -n +4 >> $(SRC)/atom.xml; \
	done
	echo "</feed>" >> $(SRC)/atom.xml


$(SRC)/%.html.m4: $(SRC)/%.md.m4 $(MARKDOWN)
	$(MARKDOWN) $< | \
		sed -e 's/^<p>\(.*({"\)/\1/g;s/^<p>\(.*"})\)/\1/g;s/\(({".*\)<\/p>/\1/g;s/\("}).*\)<\/p>/\1/g' > $@

$(SRC)/%: $(SRC)/%.m4 $(MACROS)
	m4 -P $(MACROS) $< > $@

$(DST)/%: $(SRC)/%
	install -m 644 -D $< $@

clean-index:
	-rm $(POSTS)/index.html.m4

clean-atom:
	-rm $(SRC)/atom.xml

clean: clean-index clean-atom
	mv $(DST) .old_dst
	rm -rf .old_dst

new-post:
	if [[ "$(TITLE)" == "" ]]; then echo "Error: no TITLE set"; fi
	m4 -DTITLE="$(TITLE)" -P $(TEMPLATES)/new_post.md.m4 > \
		$(POSTS)/$(shell date +%Y-%m-%d)-$(subst $(sp),-,$(TITLE)).md.m4

$(MARKDOWN):
	cd md4c && \
	mkdir -p build && \
	cd build && \
	cmake .. && \
	make

deploy:
	$(RSYNC) -avze 'ssh -p $(SSH_PORT)' $(RSYNC_DELETE) $(DST)/ $(SSH_USER):$(DOC_ROOT)

.PHONY = all pages posts index clean-index clean new-post atom clean-atom deploy
