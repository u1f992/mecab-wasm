mecab-wasm
----------

[Mecab](https://taku910.github.io/mecab/) is a morphological analyzer for Japanese.

This repository builds Mecab with Emscripten, so it can be used in a browser or Node.js.

See [examples/](examples/) for usage examples.

## Build Process

```bash
make all
```

This compiles MeCab C++ source to WebAssembly, builds the IPA dictionary, and bundles everything into the `lib/` directory.

A devcontainer configuration is provided in `.devcontainer/` with all required dependencies.

## Release Process

```bash
make clean-submodule  # npm version requires clean git state
npm version patch  # or minor, major
npm publish
```
