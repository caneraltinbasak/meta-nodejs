inherit npm

B="${S}"

NPM_INSTALL ?= ""
NPM_INSTALL_FLAGS ?= ""

do_npm_install() {
	oe_runnpm ${NPM_INSTALL_FLAGS} install ${NPM_INSTALL}
}

do_npm_shrinkwrap() {
	oe_runnpm shrinkwrap
}

do_npm_dedupe() {
	oe_runnpm dedupe
}

addtask npm_install after do_compile before do_npm_dedupe
addtask npm_shrinkwrap after do_npm_install before do_npm_dedupe
addtask npm_dedupe after do_npm_shrinkwrap before do_install