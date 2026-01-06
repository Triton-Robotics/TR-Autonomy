# Clangd setup

## TR-Autonomy repo quick setup

### clangd LSP

1. Install the `clangd (LLVM)` vscode extension (you may be prompted to install clangd if you don't have it installed on your system)
2. __Disable the C/C++ (Microsoft) vscode extension !!!__ if you have it installed 
3. you will need to `colcon build` and confirm there is a `compile_commands.json` file inside the `build/` directory 

**NOTE** Clangd relies on `compile_commands.json` to be correct and up to date. If you have issues with the LSP try `colcon build` again so `compile_commands.json` is regenerated. You can also try running `clangd: Restart Language Server` from the vscode command pallet 

### Formatting 

Add the following to your user settings.json (`ctrl + shift + p` and select `Preferences: Open User Settings (JSON)`)

```json
    "[cpp]": {
        "editor.defaultFormatter": "llvm-vs-code-extensions.vscode-clangd"
    },
```

optionally also add the following to save on format

```json
    "editor.formatOnSave": true,
```

## Details and extra info 

- there is a `colcon_defaults.yaml` that passes the cmake arg `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON` by default if you run `colcon build`

- formatting style guide can be found inside the `.clang-format` file