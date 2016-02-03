# Welcome to Tim Green''s config

This is a moduled configs with easy installer.

## How to use

   * Install `./script.sh [instal]`
   * Uninstall `./script.sh uninstall`

## Action Directory & Action Script

Under the root of module dir, `/action` dir is reserved for action script.

    <module_root>/
    |- action/
    |  |- action.sh                        - Action script
    |  |- config.json                      - Config
    |  |- .action_cwd/                     - Temporary work dir for action script
    |  |  |- generated_action.sh           - Generated base on action.sh, adding imports & main function
    |  |  \ ... other temporary files used during action script lifecycle
    |  |
    |  \ ... other resource needed by action script
    |
    \ ... other linkable config
TODO(timgreen):
