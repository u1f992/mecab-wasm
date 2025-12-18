PRODUCTS := lib/libmecab.js lib/libmecab.data lib/libmecab.wasm

.PHONY: all
all: $(PRODUCTS)

mecab/mecab/src/.libs/libmecab.so:
	echo '{"type": "commonjs"}' > mecab/mecab/package.json
	cd mecab/mecab && emconfigure ./configure && emmake make -j9 CXXFLAGS="-std=c++14"
	rm -f mecab/mecab/package.json

mecab/mecab-ipadic/dist/sys.dic:
	cd mecab/mecab-ipadic && ./configure --with-dicdir=$$PWD/dist && make && /usr/lib/mecab/mecab-dict-index -f euc-jp -t utf-8 && make install

$(PRODUCTS): mecab/mecab/src/.libs/libmecab.so mecab/mecab-ipadic/dist/sys.dic build_js.sh
	@bash -x ./build_js.sh

.PHONY: clean-submodule
clean-submodule:
	cd mecab && git checkout -- . && git clean -fdx
