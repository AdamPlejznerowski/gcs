if get_option('GCPP_ENABLE_DEPS_GNOME_SYSROOT').enabled()

    sysroot_dir = meson.project_source_root() / 'deps/gnome-sysroot'
    gir_path = sysroot_dir / 'usr/share/gir-1.0'
    lib_dir = sysroot_dir / 'usr/lib/x86_64-linux-gnu'
    extra_link_args = ['-L' + lib_dir, '-Wl,-rpath,' + lib_dir]
else
    gir_path = '/usr/share/gir-1.0'
    extra_link_args = []
endif

cppgir_local = find_program('cppgir', native: true)

bindings_tgt = custom_target('generated',
    output: 'generated',
    command: [
        'cppgir',
        '--output', '@OUTPUT@',
        '--ignore', meson.project_source_root() / 'subprojects/cppgir/data/cppgir.ignore',
        '--gir-path', gir_path,
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
    sources: bindings_tgt,
    link_args: extra_link_args
)