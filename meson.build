project(
    'gcpp',
    'cpp',
    version: '0.1.0',
    default_options: [
        'cpp_std=c++23',
        'warning_level=3',
        'werror=false',
    ]
)

add_project_arguments(
    '-fmodules-ts',
    '-Wno-pedantic',
    language: 'cpp'
)

if get_option('GCPP_ENABLE_DEPS_GNOME_SYSROOT').enabled()

run_command(
    find_program('bash'),
    meson.project_source_root() / 'setup_sysroot.sh',
    check: true
)
endif

subproject('cppgir')
subdir('src')