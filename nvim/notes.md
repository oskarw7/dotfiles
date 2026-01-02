# Notes

## 1. dependecies:
    - npm
    - rust (all) + rust-analyzer
    - python
    - uv (optional yet helpful)


## 2. lsp-config.nvim:
    - `rust_analyzer` has to be installed manually with `rusttup component add rust-analyzer`
        - thus it was removed from `ensure_installed` part
        - before that mason.nvim had opened two sessions
    - `pyright` has to be installed manually, I recommend doing that in venv (`pip install pyright`, `uv add --dev pyright`)

## 3. nvim-lint.nvim:
    - `pylint` has to be installed manually, I recommend doing that in venv (`pip install pyright`, `uv add --dev pyright`)

