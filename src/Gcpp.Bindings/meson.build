cppgir_local = find_program('cppgir', native: true)

bindings_tgt = custom_target('generated',
    output: 'generated',
    command: [
        'cppgir',
        '--output', '@OUTPUT@',
        '--ignore', meson.project_source_root() / 'subprojects/cppgir/data/cppgir.ignore',
        '--gir-path', '/usr/share/gir-1.0',
        'GLib',
        'GObject',
        'Gio',
        'Meta',
        'Clutter',
        'St'
    ],
    build_by_default: true
)
gcpp_bindings_inc = include_directories('.')
gcpp_bindings_dep = declare_dependency(
    include_directories: gcpp_bindings_inc,
    sources: bindings_tgt
)