htop (1.0.3) config is ~/.config/htop/htoprc. It's in managed by app itself, when you change settings inside htop, the config will be overwrite.

Here is the config I'd like to force during the config install. Lines in code block will be processed by action.sh script.

    cpu_count_from_zero=1
    highlight_base_name=1
    highlight_threads=1
    shadow_other_users=1
    tree_view=1
